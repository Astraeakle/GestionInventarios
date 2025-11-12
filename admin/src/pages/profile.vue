<template>
    <VCard class="pa-4" title="Perfil de Usuario">
        <template #append>
            <div class="d-flex align-center gap-2">
                <VBtn variant="outlined" color="secondary" :disabled="!isDataChanged" @click="cancelChanges">
                    Cancelar
                </VBtn>

                <VBtn color="primary" prepend-icon="ri-save-3-line" :disabled="!isDataChanged" @click="saveChanges">
                    Guardar
                </VBtn>
            </div>
        </template>

        <VContainer class="py-6 px-4">
            <!-- CARD PRINCIPAL -->
            <VCard class="pa-6 mb-6">
                <VRow align="center" justify="start">
                    <VCol cols="auto">
                        <VAvatar size="90" class="elevation-1">
                            <VImg :src="profile.avatar || defaultAvatar" />
                        </VAvatar>
                        <VFileInput v-if="isDataChanged" label="Cambiar Avatar" @change="onAvatarChange" class="mt-2" />
                    </VCol>

                    <VCol>
                        <h2 class="text-h6 mb-1">{{ profile.full_name }}</h2>
                        <p class="text-body-2 mb-1">
                            Rol: <strong>{{ profile.role?.name }}</strong>
                        </p>
                        <p class="text-body-2 mb-1">
                            Sucursal: <strong>{{ profile.sucursale?.name }}</strong>
                        </p>
                        <p class="text-body-2">
                            Email: <strong>{{ profile.email }}</strong>
                        </p>

                    </VCol>
                </VRow>
            </VCard>

            <!-- INFO BÁSICA -->
            <VCard class="pa-6 mb-6">
                <h3 class="text-subtitle-1 font-weight-bold mb-4">
                    Información básica
                </h3>

                <VRow>
                    <VCol cols="12" md="6">
                        <VTextField v-model="profile.full_name" label="Nombre" :readonly="!isDataChanged" />
                    </VCol>

                    <VCol cols="12" md="6">
                        <VTextField v-model="profile.surname" label="Apellido" :readonly="!isDataChanged" />
                    </VCol>

                    <VCol cols="12" md="6">
                        <VTextField v-model="profile.email" label="Correo electrónico" :readonly="!isDataChanged" />
                    </VCol>

                    <VCol cols="12" md="6">
                        <VTextField v-model="profile.phone" label="Teléfono" :readonly="!isDataChanged" />
                    </VCol>

                    <VCol cols="12" md="6">
                        <VSelect v-model="profile.tipo_documento" :items="['DNI', 'PASAPORTE', 'CARNET DE EXTRANJERIA']"
                            label="Tipo de documento" :readonly="!isDataChanged" />
                    </VCol>

                    <VCol cols="12" md="6">
                        <VTextField v-model="profile.n_documento" label="N° de documento" :readonly="!isDataChanged" />
                    </VCol>

                    <VCol cols="12" md="6">
                        <VSelect v-model="profile.estado" :items="['Activo', 'Inactivo']" label="Estado"
                            :readonly="!isDataChanged" />
                    </VCol>

                    <VBtn variant="tonal" color="orange-lighten-1" prepend-icon="ri-lock-2-line" class="mt-3"
                        @click="showPasswordDialog = true">
                        Cambiar contraseña
                    </VBtn>
                </VRow>
            </VCard>
        </VContainer>

        <!-- DIALOG CAMBIO DE CONTRASEÑA -->
        <VDialog v-model="showPasswordDialog" max-width="400">
            <VCard>
                <VCardTitle>Cambiar contraseña</VCardTitle>
                <VCardText>
                    <VTextField v-model="passwordData.current" label="Contraseña actual" type="password" class="mb-3" />
                    <VTextField v-model="passwordData.new" label="Nueva contraseña" type="password" class="mb-3" />
                    <VTextField v-model="passwordData.confirm" label="Confirmar nueva contraseña" type="password" />
                </VCardText>
                <VCardActions>
                    <VSpacer />
                    <VBtn text @click="showPasswordDialog = false">Cancelar</VBtn>
                    <VBtn color="primary" @click="updatePassword">Guardar</VBtn>
                </VCardActions>
            </VCard>
        </VDialog>
    </VCard>
</template>

<script setup>
import { ref, reactive, onMounted, watch } from "vue";
import avatarDefault from "@images/avatars/avatar-1.png";

const defaultAvatar = avatarDefault;
const showPasswordDialog = ref(false);
const isDataChanged = ref(false);
const profile = reactive({
    id: null,
    full_name: "",
    email: "",
    phone: "",
    tipo_documento: "DNI",
    n_documento: "",
    role: null,
    sucursale: null,
    estado: "Activo",
    avatar: "",
});
const originalData = ref({});
const passwordData = reactive({
    current: "",
    new: "",
    confirm: "",
});
const FILE_AVATAR = ref(null);

// Cargar datos del usuario logueado
const loadProfile = async () => {
    const localUser = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : null;
    if (localUser) {
        Object.assign(profile, localUser);
        originalData.value = JSON.parse(JSON.stringify(localUser));
    }
};

// Detectar cambios
watch(profile, (newVal) => {
    isDataChanged.value = JSON.stringify(newVal) !== JSON.stringify(originalData.value);
}, { deep: true });

// Cancelar cambios
const cancelChanges = () => {
    Object.assign(profile, originalData.value);
    isDataChanged.value = false;
};

// Guardar cambios
const saveChanges = async () => {
    try {
        const formData = new FormData();
        Object.keys(profile).forEach(key => {
            formData.append(key, profile[key]);
        });
        if (FILE_AVATAR.value) formData.append("avatar", FILE_AVATAR.value);

        const resp = await $api(`users/${profile.id}`, { method: "PUT", body: formData });
        localStorage.setItem("user", JSON.stringify(resp.user));
        originalData.value = JSON.parse(JSON.stringify(resp.user));
        isDataChanged.value = false;
    } catch (error) {
        console.error("Error al guardar perfil:", error);
    }
};

// Cambiar contraseña
const updatePassword = async () => {
    if (passwordData.new !== passwordData.confirm) {
        alert("Las contraseñas no coinciden");
        return;
    }
    await $api("users/update-password", { method: "POST", body: passwordData });
    showPasswordDialog.value = false;
    passwordData.current = passwordData.new = passwordData.confirm = "";
};

// Cambiar avatar
const onAvatarChange = ($event) => {
    FILE_AVATAR.value = $event.target.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(FILE_AVATAR.value);
    reader.onloadend = () => profile.avatar = reader.result;
};

onMounted(() => loadProfile());
</script>
