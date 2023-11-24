<div class="container">
    <!-- Outer Row -->
    <div class="row">
        <div class="col-12 mt-3 form-wrapper">
            <center>
                <img src="<?= base_url() ?>assets/img/SMK_N_3_TEGAL-removebg-preview.png" alt="">
            </center>
            <br>
            <div class="w-50 container bg-white">
                <br>
                <center>
                    <h3>Login</h3>
                </center>
                <?php if ($this->session->flashdata('success')) { ?>
                <div id="msg-success" class="alert alert-success">
                    <?= $this->session->flashdata('success') ?>
                </div>
                <script>
                    var myElement = document.getElementById('msg-success');
                    setTimeout(function () {
                        myElement.style.display = 'none';
                    }, 3000);</script>
                <?php } ?>
                <hr style="border-top:1px solid rgb(0 0 0)">
                <form class="user">
                    <div class="form-group">
                        <label for="user">email :</label>
                        <input type="text" class="form-control " id="user" name="user" aria-describedby="usernameHelp"
                            placeholder="Masukan Email" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="pwd">password :</label>
                        <input type="password" class="form-control " id="pwd" name="pwd" placeholder="Masukan Password">
                    </div>
                    <button type="button" class="btn btn-primary btn btn-primary btn-block" onclick="proses_login()"
                        id="login"> Login</button>
                    <a href="<?= base_url(); ?>register" class="btn btn-primary btn btn-primary btn-block"> Register
                    </a> <br>
            </div>
            </form>
            <br><br>
        </div>
    </div>
</div>

</div>
<script src="<?= base_url(); ?>assets/js/jquery.min.js"></script>
<script src="<?= base_url(); ?>assets/js/login.js"></script>
<?php if($this->session->flashdata('Pesan')): ?>
<?= $this->session->flashdata('Pesan'); ?>
<?php else: ?>
<script>
    $(document).ready(function () {

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