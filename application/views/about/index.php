<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-5">
        <h1 class="h3 mb-0 text-gray-800">About</h1>
        
        <?php if($this->session->userdata('level') == 'admin'): ?>
        <a href="<?= base_url() ?>about/ubah/" class="btn btn-sm btn-primary btn-icon-split">
            <span class="text text-white">Ubah Profil</span>
            <span class="icon text-white-50">
                <i class="fas fa-pen"></i>
            </span>
        </a>
        <?php endif; ?>
    </div>

    <div class="col-lg-12 mb-4">

        <!-- Illustrations -->
        <div class="card shadow mb-4">
            <div class="card-body">
                <center>
                    <div class="col-lg-12 mb-4">
                        <div class="box-circle bg-primary posisi">
                            <img class="img-about rounded-circle" id="outputImg" width="100%" height="100%"
                                src="<?= base_url() ?>assets/upload/pengguna/user.png">
                        </div>
                        <br>
                        <input type="hidden" name="iduser" id="iduser" value="">
                        <p id="keterangan" style="margin-bottom:14px"></p>
                        <h1 class="h1 mb-0 text-gray-800 posisi" id="namaL">-</h1><br>
                        
                    </div>
                </center>

                <div class="row posisi3">
                    <div class="col-lg-6">
                        <center>
                            <h3 class="h3 mb-0 text-gray-800 d-sm-flex justify-content-center">
                                <i class="fa fa-envelope"></i>
                                &nbsp;
                                <div class="div" id="email">-</div>
                            </h3>
                        <!-- Divider -->
                        <div class="col-6">
                            <center>
                                <hr class="sidebar-divider">
                            </center>
                        </div>
                        </center>
                    </div>
                    <div class="col-lg-6">
                        <center>
                            <h3 class="h3 mb-0 text-gray-800 d-sm-flex justify-content-center">
                                <i class="fa fa-phone"></i>
                                &nbsp;
                                <div class="div" id="notelp">-</div>
                            </h3>
                        <div class="col-6">
                            <center>
                                <hr class="sidebar-divider">
                            </center>
                        </div>
                        </center>
                    </div>
                </div>
                <div class="row posisi4">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script src="<?= base_url(); ?>assets/js/jquery.min.js"></script>
<script>
    $(document).ready(function() {
    ambilData();
});

function ambilData(){
    var id = "1";
    var link = $('#baseurl').val();
    var base_url = link + 'about/detail_data';
    var link_gambar = link + 'assets/upload/pengguna/';
    
    $.ajax({
        type:'POST',
        data:'id='+id,
        url:base_url,
        dataType:'json',
        success: function(hasil){
            $("#namaL").text(hasil[0].nama_developer);
            $("#email").text(hasil[0].email);
            $("#notelp").text(hasil[0].no_hp);
            $("#keterangan").text(hasil[0].keterangan);
            document.getElementById('outputImg').src = link_gambar+hasil[0].foto;
        }   
    });
}

function pesan(judul, deskripsi, status) {
    swal.fire({
        title: judul,
        text: deskripsi,
        icon: status,
        confirmButtonColor: '#4e73df',
    });
}

</script>

<?php if($this->session->flashdata('Pesan')): ?>
<?= $this->session->flashdata('Pesan') ?>
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