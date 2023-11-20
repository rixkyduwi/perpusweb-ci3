<div class="container">
    <!-- Outer Row -->
    <div class="row">
        <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 mt-5 pt-3 pb-3  from-wrapper">
            <center>
            <img src="<?= base_url() ?>assets/img/SMK_N_3_TEGAL-removebg-preview.png"alt="">
            </center>
            <br>
            <br> 
            <div class="container bg-white">
                <br><center><h3>Login</h3></center>
                <hr> 
                    <form class="user">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="user" name="user" aria-describedby="usernameHelp" placeholder="Masukan NIS" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control form-control-user" id="pwd" name="pwd" placeholder="Masukan Password">
                    </div>
                    <button type="button" class="btn btn-primary btn btn-primary btn-block" onclick="proses_login()" id="login"> Login</button>
                    <a href="<?= base_url(); ?>register" class="btn btn-primary btn btn-primary btn-block" > Register </a>  <br>
                    </div>                             
                    </form>
                <br><br>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="mx-auto mt-4">
        </div>
    </div>
</div>
<script src="<?= base_url(); ?>assets/js/jquery.min.js"></script>
<script src="<?= base_url(); ?>assets/js/login.js"></script>
<?php if($this->session->flashdata('Pesan')): ?>
<?= $this->session->flashdata('Pesan'); ?>
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
        $("#card").addClass("bounceIn");
    })
});
</script>
<?php endif; ?>