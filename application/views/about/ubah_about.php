<!-- Begin Page Content -->
<div class="container-fluid">
    <form action="<?= base_url() ?>about/proses_ubah" name="myForm" method="POST" enctype="multipart/form-data"
        onsubmit="return validateForm()">
        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <div class="d-sm-flex">
                <a href="<?= base_url() ?>about" class="btn btn-md btn-circle btn-primary">
                    <i class="fas fa-arrow-left"></i>
                </a>
                &nbsp;
                <h1 class="h2 mb-0 text-gray-800">Ubah About</h1>
            </div>
            <button type="submit" class="btn btn-success btn-md btn-icon-split">
                <span class="text text-white">Simpan Perubahan</span>
                <span class="icon text-white-50">
                    <i class="fas fa-save"></i>
                </span>
            </button>
        </div>
        <div class="d-sm-flex  justify-content-between mb-0">
            <div class="col-lg-8 mb-4">
                <!-- form -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Form Edit About</h6>
                    </div>
                    <div class="card-body">
                        <div class="col-lg-12">
                             <!-- ID User-->
                                <input class="form-control" name="id" type="hidden" value="<?= $developer->id ?>" readonly>
                            
                            <!-- Nama Lengkap -->
                            <div class="form-group"><label>Nama Developer</label>
                                <input class="form-control" name="nama_developer" type="text" value="<?= $developer->nama_developer ?>">
                            </div>

                            <!-- NO Telepon -->
                            <div class="form-group"><label>Nomor Telepon</label>
                                <input class="form-control" name="no_hp" type="number" value="<?= $developer->no_hp ?>">
                            </div>

                            <!-- Email -->
                            <div class="form-group"><label>Email</label>
                                <input class="form-control" name="email" type="email" value="<?= $developer->email ?>">
                            </div>
                            <!-- Keterangan -->
                            <div class="form-group"><label>Keterangan</label>
                                <input class="form-control" name="keterangan" type="text" value="<?= $developer->keterangan ?>">
                            </div>

                        </div>
                        <br>
                    </div>
                </div>

            </div>

            <div class="col-lg-4 mb-4">
                <!-- file -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Foto</h6>
                    </div>
                    <div class="card-body">
                        <div class="card bg-warning text-white shadow">
                            <div class="card-body">
                                Format
                                <div class="text-white-45 small">.png .jpeg .jpg .tiff .gif .tif</div>
                            </div>
                        </div>
                        <br>
                        <center>
                            <div>
                                <img src="<?= base_url() ?>assets/upload/pengguna/<?= $developer->foto ?>" id="outputImg" width="200"
                                    maxheight="300">
                            </div>
                        </center>
                        <br>
                        <span class="text-danger">*kosongkan jika tidak ingin merubah</span>
                        <!-- foto -->
                        <div class="form-group">
                            <div class="custom-file">
                                <input type="hidden" name="fotoLama" value="<?= $developer->foto ?>">
                                <input class="custom-file-input" type="file" id="GetFile" name="photo"
                                    onchange="VerifyFileNameAndFileSize()" accept=".png,.gif,.jpeg,.tiff,.jpg">
                                <label class="custom-file-label" for="customFile">Pilih File</label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>

</div>
<!-- /.container-fluid -->


</div>
<!-- End of Main Content -->

<script src="<?= base_url(); ?>assets/js/jquery.min.js"></script>

<script>
$(document).ready(function() {
    $('#dtHorizontalExample').DataTable({
        "scrollX": true
    });
    $('.dataTables_length').addClass('bs-select');


});

function detail(id) {
    var base_url = $('#baseurl').val();
    window.location.href = base_url + "user/detail_data/" + id;

}

function konfirmasi(id) {
    var base_url = $('#baseurl').val();

    swal.fire({
        title: "Hapus Data ini?",
        icon: "warning",
        closeOnClickOutside: false,
        showCancelButton: true,
        confirmButtonText: 'Iya',
        confirmButtonColor: '#4e73df',
        cancelButtonText: 'Batal',
        cancelButtonColor: '#d33',
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                title: "Memuat...",
                onBeforeOpen: () => {
                    Swal.showLoading()
                },
                timer: 1000,
                showConfirmButton: false,
            }).then(
                function() {
                    window.location.href = base_url + "user/proses_hapus/" + id;
                }
            );
        }
    });

}
</script>
<script src="<?= base_url(); ?>assets/js/validasi/formuser.js">
function validateForm() {
    var nama_developer = document.forms["myForm"]["nama_developer"].value;
    var no_hp = document.forms["myForm"]["no_hp"].value;
    var email = document.forms["myForm"]["email"].value;
    var keterangan = document.forms["myForm"]["keterangan"].value;

    if (nama_developer == "") {
        validasi('Nama User wajib di isi!', 'warning');
        return false;
    } else if (no_hp == '') {
        validasi('Nomor Telepon wajib di isi!', 'warning');
        return false;
    } else if (email == '') {
        validasi('Email wajib di isi!', 'warning');
        return false;
    }else if (keterangan == '') {
        validasi('Keterangan wajib di isi!', 'warning');
        return false;
    }

}


function validasi(judul, status) {
    swal.fire({
        title: judul,
        icon: status,
        confirmButtonColor: '#4e73df',
    });
}


function fileIsValid(fileName) {
    var ext = fileName.match(/\.([^\.]+)$/)[1];
    ext = ext.toLowerCase();
    var isValid = true;
    switch (ext) {
        case 'png':
        case 'jpeg':
        case 'jpg':
        case 'tiff':
        case 'gif':
        case 'tif':
        case 'pdf':

            break;
        default:
            this.value = '';
            isValid = false;
    }
    return isValid;
}

function VerifyFileNameAndFileSize() {
    var file = document.getElementById('GetFile').files[0];


    if (file != null) {
        var fileName = file.name;
        if (fileIsValid(fileName) == false) {
            validasi('Format bukan gambar!', 'warning');
            document.getElementById('GetFile').value = null;
            return false;
        }
        var content;
        var size = file.size;
        if ((size != null) && ((size / (1024 * 1024)) > 3)) {
            validasi('Ukuran maximum 1024px', 'warning');
            document.getElementById('GetFile').value = null;
            return false;
        }

        var ext = fileName.match(/\.([^\.]+)$/)[1];
        ext = ext.toLowerCase();

        if (ext == 'pdf') {
            $('#pdf').show();
            $('#img').hide();
            $(".custom-file-label").addClass("selected").html(file.name);
            document.getElementById('outputPdf').src = window.URL.createObjectURL(file);
        } else {
            $('#pdf').hide();
            $('#img').show();
            $(".custom-file-label").addClass("selected").html(file.name);
            document.getElementById('outputImg').src = window.URL.createObjectURL(file);
        }
        return true;

    } else
        return false;
}</script>


<?php if($this->session->flashdata('Pesan')): ?>

<?php else: ?>
<script>
$(document).ready(function() {

    let timerInterval
    Swal.fire({
        title: 'Memuat...',
        timer: 1000,
        onBeforeOpen: () => {
            Swal.showLoading()
        },
        onClose: () => {
            clearInterval(timerInterval)
        }
    }).then((result) => {

    })
});
</script>
<?php endif; ?>