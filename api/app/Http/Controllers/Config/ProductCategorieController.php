<?php
namespace App\Http\Controllers\Config;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Config\ProductCategorie;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;

class ProductCategorieController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->get("search");

        $categories = ProductCategorie::where("title", "ilike", "%" . $search . "%")
            ->orderBy("id", "desc")
            ->get();

        return response()->json([
            "categories" => $categories->map(function ($categorie) {
                return [
                    "id" => $categorie->id,
                    "title" => $categorie->title,
                    "state" => (int) $categorie->state,
                    "imagen" => $categorie->imagen ? asset("storage/" . $categorie->imagen) : null,
                    "created_at" => $categorie->created_at->format("Y-m-d h:i A"),
                ];
            }),
        ]);
    }

    public function store(Request $request)
    {
        $is_categorie_exists = ProductCategorie::where("title", $request->title)->first();
        if ($is_categorie_exists) {
            return response()->json([
                "message" => 403,
                "message_text" => "LA CATEGORIA YA EXISTE"
            ]);
        }

        if ($request->hasFile("image")) {
            $path = Storage::disk('public')->putFile('categories', $request->file('image'));
            $request->merge(['imagen' => $path]);
        }

        $categorie = ProductCategorie::create($request->all());

        return response()->json([
            "message" => 200,
            "categorie" => [
                "id" => $categorie->id,
                "title" => $categorie->title,
                "state" => (int) $categorie->state,
                "imagen" => $categorie->imagen ? asset("storage/" . $categorie->imagen) : null,
                "created_at" => $categorie->created_at->format("Y-m-d h:i A"),
            ],
        ]);
    }

    public function show(string $id)
    {
        //
    }

    public function update(Request $request, string $id)
    {
        $is_categorie_exists = ProductCategorie::where("title", $request->title)
            ->where("id", "<>", $id)
            ->first();

        if ($is_categorie_exists) {
            return response()->json([
                "message" => 403,
                "message_text" => "LA CATEGORIA YA EXISTE"
            ]);
        }

        $categorie = ProductCategorie::findOrFail($id);

        if ($request->hasFile("image")) {
            // Eliminar imagen anterior si existía
            if ($categorie->imagen && Storage::disk('public')->exists($categorie->imagen)) {
                Storage::disk('public')->delete($categorie->imagen);
            }

            // Crear instancia del ImageManager
            $manager = new ImageManager(new Driver());
            $image = $request->file("image");
            $filename = time() . '_' . $image->getClientOriginalName();
            $relativePath = 'categories/' . $filename;
            $absolutePath = storage_path('app/public/' . $relativePath);

            // Asegurar carpeta
            if (!file_exists(dirname($absolutePath))) {
                mkdir(dirname($absolutePath), 0777, true);
            }

            // Procesar imagen con Intervention
            $img = $manager->read($image->getRealPath());
            $width = $img->width();
            $height = $img->height();
            $side = min($width, $height);
            $img = $img->crop($side, $side)->scale(600, 600);
            $img->save($absolutePath, quality: 80);

            // Actualizar el campo imagen
            $request->merge(['imagen' => $relativePath]);
        }

        $categorie->update($request->all());

        return response()->json([
            "message" => 200,
            "categorie" => [
                "id" => $categorie->id,
                "title" => $categorie->title,
                "state" => (int) $categorie->state,
                "imagen" => $categorie->imagen ? asset("storage/" . $categorie->imagen) : null,
                "created_at" => $categorie->created_at->format("Y-m-d h:i A"),
            ],
        ]);
    }

    public function destroy(string $id)
    {
        $categorie = ProductCategorie::findOrFail($id);
        if ($categorie->imagen && Storage::disk('public')->exists($categorie->imagen)) {
            Storage::disk('public')->delete($categorie->imagen);
        }
        $categorie->delete();
        return response()->json([
            "message" => 200,
        ]);
    }
}