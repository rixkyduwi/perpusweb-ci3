<!-- Begin Page Content -->
<div class="container-fluid">

    <form action="<?= base_url() ?>pengembalian/proses_tambah" name="myForm" method="POST" enctype="multipart/form-data"
        onsubmit="return validateForm()">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <div class="d-sm-flex">
                <a href="<?= base_url() ?>pengembalian" class="btn btn-md btn-circle btn-primary">
                    <i class="fas fa-arrow-left"></i>
                </a>
                &nbsp;
                <h1 class="h2 mb-0 text-gray-800">Pengembalian</h1>
            </div>

            <button type="submit" class="btn btn-primary btn-md btn-icon-split " data-toggle="tooltip" data-placement="bottom" title="klik apabila buku dan denda sudah selesai">
                <span class="text text-white">Simpan Pengembalian Buku</span>
                <span class="icon text-white-50">
                    <i class="fas fa-save"></i>
                </span>
            </button>
            
        </div>

        <!-- form pengembalian -->
        <div class="col-lg-12 mb-4">
            <div class="card shadow mb-4">
                <div class="card-body">

                    <div class="form-group mb-4">
                        <label>Cari ID Pinjam / Anggota</label>
                        <div class="row">
                            <div class="col-lg-10">
                                <input type="hidden" name="tglnow" id="tglnow" value="<?= $tglnow ?>">
                                <input type="hidden" name="terlambat" >
                                <input type="hidden" name="denda" >
                                <select name="pinjam" class="form-control chosen" onchange="ambilDataPinjam()">
                                    <option value="">--Pilih--</option>
                                    
                                <?php if($this->session->userdata('level') == 'admin'):?>
                                    <?php foreach($pinjam as $p): ?>
                                    <option value="<?= $p->id_pinjam?> - <?= $p->nama_lengkap ?>"><?= $p->id_pinjam ?> - <?= $p->nama_lengkap ?>
                                    </option>
                                    <?php endforeach; ?>
                                <?php elseif($this->session->userdata('level') == 'siswa'):?>
                                    <?php foreach($pinjam as $p): ?>
                                    
                                <?php if($p->nama_lengkap==$this->session->userdata('nama')) :?>
                                    <option value="<?= $p->id_pinjam?> - <?= $p->nama_lengkap ?>"><?= $p->id_pinjam ?> - <?= $p->nama_lengkap ?>
                                    </option>
                                    <script>
                                        $('[name="pinjam"]').val("<?= $p->id_pinjam ?> - <?= $p->nama_lengkap ?>");
                                    </script>
                                    <?php endif ;?>
                                    <?php endforeach ?>
                                <?php endif ?>
                                </select>
                            </div>
                            <div class="col-lg">
                                <label id="loding">Memuat...</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">

                        <div class="col-lg-2">
                            <div class="form-group">
                                <Label>Tanggal Pinjam</Label>
                                <h6 class="m-0 font-weight-bold" id="tglpinjam">-</h6>
                                <!-- Divider -->
                                <hr class="sidebar-divider">
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="form-group">
                                <Label>Tempo</Label>
                                <?php if($this->session->userdata('level') == 'admin'):?>
                                    <input class="form-control date" type="date" onchange="gantitempo()" id="tempo">
                                <?php elseif($this->session->userdata('level') == 'siswa'):?>
                                    <h6 class="m-0 font-weight-bold" id="tempo">-</h6>
                                <?php endif ?>
                                <!-- Divider -->
                                <hr class="sidebar-divider">
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="form-group">
                                <Label>Terlambat</Label>
                                <h6 class="m-0 font-weight-bold" id="lambat">-</h6>
                                <!-- Divider -->
                                <hr class="sidebar-divider">
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="form-group">
                                <Label>Denda</Label>
                                <h6 class="m-0 font-weight-bold" id="denda">-</h6>
                                <!-- Divider -->
                                <hr class="sidebar-divider">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <Label>Kirim Tagihan Ke Email : </Label>
                                
                                <?php echo validation_errors(); ?>
                                <?php echo form_open('email_controller/send_email'); ?>
                                <input class="form-control"  type="email" value="" name="to_email">
                                <input style="display:none" type="text" value="pengembalian buku" name="subject">
                                <input style="display:none" id="message"name="message" type="text">
                                <h6 class="m-0 font-weight-bold" id="kirimtagihan">-</h6>
                                <?php echo form_close(); ?>
                                <!-- Divider -->
                                <hr class="sidebar-divider">
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-12 mb-4">
                        <Label>List Buku</Label>
                        <div id="table-container" class="table-responsive">
                            <table class="table" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th width="1%">No</th>
                                        <th>ID Buku</th>
                                        <th>Judul</th>
                                        <th>ISBN</th>
                                        <th>Pengarang</th>
                                        <th>Qty</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                            </table>
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
    $('#loding').hide();

});
console.log("jalan1")
function konfirmasi(id) {
    var base_url = $('#baseurl').val();
    console.log("jalan2")

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
            console.log("jalan3")
            Swal.fire({
                title: "Memuat...",
                onBeforeOpen: () => {
                    Swal.showLoading()
                },
                timer: 1000,
                showConfirmButton: false,
            }).then(
                function() {
                    window.location.href = base_url + "pengembalian/proses_hapus/" + id;
                }
            );
        }
    });

}
var user="<?= $this->session->userdata('level') ?>"
$("[name='to_email']").hide();
data = []
buku = []
user = []
function ambilDataPinjam() {
    console.log("jalan4");
    var link = $('#baseurl').val();
    var base_url = link + 'pengembalian/getPinjam';
    var pinjam = $('[name="pinjam"]').val().split('-');
    console.log(pinjam)
    pinjam = pinjam[0];
    var datenow = $('[name="tglnow"]').val().split('-');

    $('#loding').show();

    if (pinjam == '') {
        console.log("jalan5");
        $('#tglpinjam').text("-");
        $('#tempo').text("-");
        $('#lambat').text("-");
        $('#denda').text("-");
        $("[name='terlambat']").val("-");
        $("[name='denda']").val("-");
        $("#tbody").empty();
        $('#loding').hide();
    } else {
        console.log("jalan6");
        $.ajax({
            type: 'POST',
            data: 'id=' + pinjam,
            url: base_url,
            dataType: 'json',
            success: function(hasil) {
                console.log("jalan7");
                data = hasil
                // Memanggil fungsi dengan callback
                ambilUser(hasil[0].id_pinjam, function(p_user) {
                    console.log(p_user[0].id);
                });
                ambilBuku(hasil[0].id_pinjam, function(p_buku) {
                    console.log(p_buku);
                    buku = p_buku
                    $("#tbody").empty();
                    $('#loding').hide();

                    $('#tglpinjam').text(hasil[0].tgl_pinjam);
                    if (user == "admin"){
                        $('#tempo').val(hasil[0].tempo);
                    }
                    else{
                        $('#tempo').text(hasil[0].tempo);
                    }
                    tentukanjatuhtempo(hasil[0].tempo.split('-'));
                });
            }
        });
    }
}

function tentukanjatuhtempo(tgl){
    var datenow = $('[name="tglnow"]').val().split('-');
    var tgl_pinjam = $('#tglpinjam').text()
    console.log(tgl);
    console.log(datenow);
    var selisihhari = selisih(tgl, datenow);
    console.log(parseInt(selisihhari))
    
    var table = "<table class='table' width='100%' cellspacing='0'>";
        var thead = '<thead><tr><th width="1%">No</th><th>ID Buku</th><th>Judul</th><th>ISBN</th><th>Pengarang</th><th>Qty</th></tr></thead>';
        table += thead;
        var tbody = "<tbody>";
        for (var i = 0; i < buku.length; i++) {
            var newRow = "<tr>"
            var cols = "";
            var counter = i + 1;
            cols += '<td align="center">' + counter + '.</td>';
            cols += '<td align="center">' + buku[i].id_buku + '</td>';
            cols += "<td class='judul_buku' align='center'>" + buku[i].judul + '</td>';
            cols += '<td align="center">' + buku[i].isbn + '</td>';
            cols += '<td align="center">' + buku[i].pengarang + '</td>';
            cols += '<td align="center">' + buku[i].qty + '</td>';
            newRow += cols;
            newRow += "</tr>"
            tbody += newRow;
        }
        tbody += "</tbody>";
        table += tbody;
        table += "</table>";
        $("#table-container").html(table);
        
    if (parseInt(selisihhari) > 0) {
        $("[name='to_email']").show();
        console.log("jalan8");
        var haritelat = selisihhari+ " hari";
        $('#lambat').text(selisihhari+ " hari");
        $("[name='terlambat']").val(selisihhari+ " hari");
        var dendarp = denda(selisihhari);
        $("[name='denda']").val(dendarp);
        $('#denda').text(dendarp);
        $('#kirimtagihan').html("<p><input class='btn btn-danger mt-1' type='button' value='Send Email' onclick='sendEmail()'></p>");
        $("[name='subject']").val("Penagihan Pengembalian Buku Telat "+selisihhari+" Hari")
        
        var nama_siswa = $('[name="pinjam"]').val().split('-');
        nama_siswa =nama_siswa[1];
            $("[name='message']").val("<!DOCTYPE html> <html> <head> <title>Pemberitahuan Pengembalian Buku Terlambat</title>"+ 
            "<link href='<?= base_url(); ?>assets/sbadmin/vendor/datatables/dataTables.bootstrap4.min.css' rel='stylesheet'> </head>"+ 
            "<style> table { border-collapse: collapse; width: 100%; } table, th, td { border: 1px solid black; } th, td, tr { padding: 8px; text-align: left; } </style><body style='color:#28282B'> "+
            "<h2>Pemberitahuan Pengembalian Buku Terlambat</h2> <p>Halo "+nama_siswa+",</p> <p>Kami ingin memberitahukan bahwa beberapa "+
            "buku yang Anda pinjam dari perpustakaan kami sudah terlambat untuk dikembalikan. Berikut adalah rincian buku-buku yang Anda pinjam:</p> "+
            "<table> <tr align='left'> <th>Tanggal Peminjaman</th> <td>"+tgl_pinjam+"</td> </tr> <tr align='left'> <th>Tanggal Jatuh Tempo</th> <td>"+tgl+"</td> </tr> <tr align='left'> "+
            "<th>Denda Per Hari</th> <td>Rp.1000</td> </tr> <tr align='left'> <th>Hari Terlambat</th> <td>"+selisihhari+" Hari</td> </tr> <tr align='left'> <th>Total Denda</th> <td>"+
            dendarp+"</td> </tr> </table> "+table+" <!-- Total Denda --> <p>Total Denda Keseluruhan: "+dendarp+" </p> <p>Mohon segera mengembalikan buku-buku "+
            "yang Anda pinjam beserta denda keterlambatannya. Jika Anda memiliki pertanyaan atau membutuhkan bantuan lebih lanjut, silakan hubungi kami di 0896-5475-4724 atau "+
            "pustakagama72dtegal@gmail.com.</p> <p>Terima kasih atas perhatian Anda.</p> <p>Salam,</p> <p>Admin Perpustakaan SMK 3 Tegal</p> </body> </html> ");
        } 
    else {
        console.log("jalan9");
        $("[name='to_email']").hide();
        $('#lambat').text("-");
        $("[name='terlambat']").val("-");
        $('#denda').text("-");
        $("[name='denda']").val("-");
        $('#kirimtagihan').text("-");
    }
}
function gantitempo(){
    var temponew = $('#tempo').val().split('-')
    tentukanjatuhtempo(temponew)
}
ambilDataPinjam();
function ambilBuku(idpinjam, callback) {
    console.log("jalan10");
    var link = $('#baseurl').val();
    var base_url = link + 'pengembalian/getListBuku';
    var pinjam = idpinjam;

    $.ajax({
        type: 'POST',
        data: 'id=' + pinjam,
        url: base_url,
        dataType: 'json',
        success: function(hasil) {
            console.log("jalan11");
            callback(hasil);
        }
    });
}
function ambilUser(idpinjam, callback) {
    var link = $('#baseurl').val();
    var base_url = link + 'pengembalian/getUser';
    var pinjam = idpinjam;
    $.ajax({
        type: 'POST',
        data: 'id=' + pinjam,
        url: base_url,
        dataType: 'json',
        success: function(hasil) {
            console.log("jalan ambiluser");
            console.log(hasil)
            callback(hasil);
        },
        error: function(xhr, status, error) {
            console.error("Error fetching user data: " + error);
        }
    });
}

    function selisih(first, second) {

        console.log("jalan12")
        // Copy date parts of the timestamps, discarding the time parts.
        var one = new Date(first[0], first[1], first[2]);
        var two = new Date(second[0], second[1], second[2]);

        // // Do the math.
        var millisecondsPerDay = 1000 * 60 * 60 * 24;
        var millisBetween = two.getTime() - one.getTime();
        var days = millisBetween / millisecondsPerDay;

        // Round down.
        return Math.floor(days);
    }

    function denda(terlambat) {
        console.log("jalan13")
        var hari = terlambat;
        var dendaperhari = 1000;

        var total = hari * dendaperhari;
        console.log(total);
        return "Rp." + total;

    }
    function sendEmail() {
        var to_email = $("[name='to_email']").val();
        var subject = $("[name='subject']").val();
        var message = $("[name='message']").val();
        console.log(to_email);
        console.log(subject);
        console.log(message);
        $.ajax({
            type: 'POST',
            url: '<?php echo site_url("pengembalian/send_email"); ?>',
            data: {
                to_email: to_email,
                subject: subject,
                message: message
            },
            success: function(response) {
                alert(response);
            }
        });
    }

</script>
<script src="<?= base_url(); ?>assets/js/validasi/formpengembalian.js"></script>
<script src="<?= base_url(); ?>assets/plugin/chosen/chosen.jquery.min.js"></script>
<?php if($this->session->userdata('level') == 'admin'):?>
    <script>   
    $('.chosen').chosen({
        width: '100%',
    });
    </script>
<?php elseif($this->session->userdata('level') == 'siswa'):?>
    <script>   
    $('.chosen').chosen({
        width: '100%',
        disable_search: true 
    });
    </script>
<?php endif ?> 


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