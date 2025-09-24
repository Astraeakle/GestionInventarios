<script setup>
import { useGenerateImageVariant } from '@/@core/composable/useGenerateImageVariant'
import authV2LoginIllustrationBorderedDark from '@images/pages/auth-v2-login-illustration-bordered-dark.png'
import authV2LoginIllustrationBorderedLight from '@images/pages/auth-v2-login-illustration-bordered-light.png'
import authV2LoginIllustrationDark from '@images/pages/auth-v2-login-illustration-dark.png'
import authV2LoginIllustrationLight from '@images/pages/auth-v2-login-illustration-light.png'
import authV2LoginMaskDark from '@images/pages/auth-v2-login-mask-dark.png'
import authV2LoginMaskLight from '@images/pages/auth-v2-login-mask-light.png'
import { VNodeRenderer } from '@layouts/components/VNodeRenderer'
import { themeConfig } from '@themeConfig'

const form = ref({
  email: '',
  password: '',
  remember: false,
})
const error_exits = ref(null);
const success_exits = ref(null);
const route = useRoute()
const router = useRouter()

const login = async() => {
  try {
    error_exits.value = null;success_exits.value = null;
    const resp = await $api('auth/login',{
      method: 'POST',
      body:{
        email: form.value.email,
        password: form.value.password,
      },
      onResponseError({response}){
        console.log(response);
        error_exits.value = response._data.error;
      }
    });

    console.log(resp);
    localStorage.setItem("token",resp.access_token);
    localStorage.setItem("user",JSON.stringify(resp.user));
    success_exits.value = 1;
    await nextTick(() => {
      router.replace(route.query.to ? String(route.query.to) : '/')
    })
  } catch (error) {
    console.log(error);
  }
}

definePage({ meta: { layout: 'blank',unauthenticatedOnly: true, } })

const isPasswordVisible = ref(false)
const authV2LoginMask = useGenerateImageVariant(authV2LoginMaskLight, authV2LoginMaskDark)
const authV2LoginIllustration = useGenerateImageVariant(authV2LoginIllustrationLight, authV2LoginIllustrationDark, authV2LoginIllustrationBorderedLight, authV2LoginIllustrationBorderedDark, true)
</script>

<template>
  <RouterLink to="/">
    <div class="app-logo auth-logo">
      <VNodeRenderer :nodes="themeConfig.app.logo" />
      <h1 class="app-logo-title">
        {{ themeConfig.app.title }}
      </h1>
    </div>
  </RouterLink>

  <VRow
    no-gutters
    class="auth-wrapper"
  >
    <VCol
      md="8"
      class="d-none d-md-flex align-center justify-center position-relative"
    >
      <div class="d-flex align-center justify-center pa-10">
        <img
          :src="authV2LoginIllustration"
          class="auth-illustration w-100"
          alt="auth-illustration"
        >
      </div>
      <VImg
        :src="authV2LoginMask"
        class="d-none d-md-flex auth-footer-mask"
        alt="auth-mask"
      />
    </VCol>
    <VCol
      cols="12"
      md="4"
      class="auth-card-v2 d-flex align-center justify-center"
      style="background-color: rgb(var(--v-theme-surface));"
    >
      <VCard
        flat
        :max-width="500"
        class="mt-12 mt-sm-0 pa-5 pa-lg-7"
      >
        <VCardText>
          <h4 class="text-h4 mb-1">
            Welcome to <span class="text-capitalize">{{ themeConfig.app.title }}! 👋🏻</span>
          </h4>

          <p class="mb-0">
            Please sign-in to your account and start the adventure
          </p>
        </VCardText>

        <VCardText>
          <VForm @submit.prevent="login">
            <VRow>
              <!-- email -->
              <VCol cols="12">
                <VTextField
                  v-model="form.email"
                  autofocus
                  label="Email"
                  type="email"
                  placeholder="johndoe@email.com"
                />
              </VCol>

              <!-- password -->
              <VCol cols="12">
                <VTextField
                  v-model="form.password"
                  label="Password"
                  placeholder="············"
                  :type="isPasswordVisible ? 'text' : 'password'"
                  :append-inner-icon="isPasswordVisible ? 'ri-eye-off-line' : 'ri-eye-line'"
                  @click:append-inner="isPasswordVisible = !isPasswordVisible"
                />

                <VAlert
                  class="my-2"
                  type="error"
                  closable
                  v-if="error_exits"
                >
                  No se puede iniciar sesión intente cambiar las credenciales
                </VAlert>

                <VAlert
                  class="my-2"
                  type="success"
                  closable
                  v-if="success_exits"
                >
                  Las credenciales son correcta, puede ingresar
                </VAlert>

                <!-- remember me checkbox -->
                <!-- <div class="d-flex align-center justify-space-between flex-wrap my-6 gap-x-2">
                  <VCheckbox
                    v-model="form.remember"
                    label="Remember me"
                  />

                  <a
                    class="text-primary"
                    href="#"
                  >
                    Forgot Password?
                  </a>
                </div> -->

                <!-- login button -->
                <VBtn
                 class="my-2"
                  block
                  type="submit"
                >
                  Login
                </VBtn>
              </VCol>

            </VRow>
          </VForm>
        </VCardText>
      </VCard>
    </VCol>
  </VRow>
</template>

<style lang="scss">
@use "@core/scss/template/pages/page-auth.scss";
</style>
