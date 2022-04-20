# DOT Test

### User Interface Rules
Setiap data yang diambil dari local/API memiliki beberapa state/kondisi tampilan, yaitu:
- Loading -> Tampilan ketika loading
- Loaded -> Tampilan ketika data berhasil didapatkan, dan ingin ditampilkan
- Empty (Opsional) -> Tampilan ketika data berhadil didapatkan tetapi tidak ada isi (null/empty)
- Error -> Tampilan ketika data gagal dimuat

Jika pada halaman yang sama terdapat beberapa request data dari api/local yang dipisahkan pada setiap widget, maka:
- Setiap widget terdapat tampilan untuk setiap state
- Jarak antar widget di atur pada widget yang bersangkutan dengan menambahkan jarak bottom/bawah

### Default Custom Widget
Beberapa custom widget default bawaan architecture yang bisa digunakan:
- ShowImageFile
- ShowImageLocalLogo
- ShowImageLocal
- ShowImageNetwork
- CustomBoxShadow
- CustomDialog
- CustomTextField
- WidgetWithDefaultHorizontalPadding

## Project Structure
```
-assets/
    |--examples                 -> Dummy image projects
    |--fonts/                   -> Any fonts will we use
        |--font_name
    |--icons                    -> Custom icons based on design
    |--images                   -> Offline images like placeholder, etc.
-lib/
    |--core/
        |--error                -> Error handling (local or remote datasources)
        |--models               -> For global model like ReturnValueModel
        |--network              -> Check internet status (connected or disconnect)
        |--utils                -> Others like preferences, etc.
    |--features/                -> Split app to small features
        |--feature_a
            |--data/
                |--datasources  -> Data sources (remote and local)
                |--models       -> App models
                |--repositories -> To determine where the data is taken from (Local or remote)
            |--presentation/
                |--cubit        -> State management
                |--pages        -> Part of screen
                |--screens      -> Full view of app
                |--widgets      -> Reusable widgets
        |--feature_b         
    |--presentation/
        |--cubit                -> State management
        |--pages                -> Part of screen
        |--screens              -> Full view of app
        |--widgets              -> Reusable widgets
    |--shared/
        |--config               -> Static variable
        |--extension            -> For custom global extension
        |--widgets              -> Reusable global widgets
```
