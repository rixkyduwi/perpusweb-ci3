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

            <button type="submit" class="btn btn-primary btn-md btn-icon-split">
                <span class="text text-white">Simpan Data</span>
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
                                    <option value="<?= $p->id_pinjam?>"><?= $p->id_pinjam ?> - <?= $p->nama_lengkap ?>
                                    </option>
                                    <?php endforeach; ?>
                                <?php elseif($this->session->userdata('level') == 'siswa'):?>
                                    <?php foreach($pinjam as $p): ?>
                                    
                                <?php if($p->nama_lengkap==$this->session->userdata('nama')) :?>
                                    <option value="<?= $p->id_pinjam?>"><?= $p->id_pinjam ?> - <?= $p->nama_lengkap ?>
                                    </option>
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
                                <h6 class="m-0 font-weight-bold" id="tempo">-</h6>
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

                    </div>

                    <div class="col-lg-12 mb-4">
                        <Label>List Buku</Label>
                        <div class="table-responsive">
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

function ambilDataPinjam() {
    console.log("jalan4")
    var link = $('#baseurl').val();
    var base_url = link + 'pengembalian/getPinjam';
    var pinjam = $('[name="pinjam"]').val();
    var datenow = $('[name="tglnow"]').val().split('-');

    $('#loding').show();

    if (pinjam == '') {
        console.log("jalan5")
        $('#tglpinjam').text("-");
        $('#tempo').text("-");
        $('#lambat').text("-");
        $('#denda').text("-");
        $("[name='terlambat']").val("-");
        $("[name='denda']").val("-");
        $("#tbody").empty();
        $('#loding').hide();
    } else {
        console.log("jalan6")
        $.ajax({
            type: 'POST',
            data: 'id=' + pinjam,
            url: base_url,
            dataType: 'json',
            success: function(hasil) {
                console.log("jalan7")

                $("#tbody").empty();
                $('#loding').hide();

                $('#tglpinjam').text(hasil[0].tgl_pinjam);
                $('#tempo').text(hasil[0].tempo);
                if (selisih(hasil[0].tempo.split('-'), datenow) > 0) {
                    console.log("jalan8")
                    $('#lambat').text(selisih(hasil[0].tempo.split('-'), datenow) + " hari");
                    $("[name='terlambat']").val(selisih(hasil[0].tempo.split('-'), datenow) + " hari");
                    $("[name='denda']").val(denda(selisih(hasil[0].tempo.split('-'), datenow)));
                    $('#denda').text(denda(selisih(hasil[0].tempo.split('-'), datenow)));
                } else {
                    console.log("jalan9")
                    $('#lambat').text("-");
                    $("[name='terlambat']").val("-");
                    $('#denda').text("-");
                    $("[name='denda']").val("-");
                }

                ambilBuku(hasil[0].id_pinjam);


            }
        });
    }


    function ambilBuku(idpinjam) {
        console.log("jalan10")
        var link = $('#baseurl').val();
        var base_url = link + 'pengembalian/getListBuku';
        var pinjam = idpinjam;

        $.ajax({
            type: 'POST',
            data: 'id=' + pinjam,
            url: base_url,
            dataType: 'json',
            success: function(hasil) {

                console.log("jalan11")

                for (var i = 0; i < hasil.length; i++) {
                    var newRow = $("<tr class='bounceIn'>");
                    var cols = "";
                    var counter = i + 1;

                    cols += '<td>' + counter + '.</td>';
                    cols += '<td>' + hasil[i].id_buku + '</td>';
                    cols += '<td>' + hasil[i].judul + '</td>';
                    cols += '<td>' + hasil[i].isbn + '</td>';
                    cols += '<td>' + hasil[i].pengarang + '</td>';
                    cols += '<td>' + hasil[i].qty + '</td>';

                    newRow.append(cols);
                    $("table").append(newRow);

                }

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

}
</script>
<script src="<?= base_url(); ?>assets/js/validasi/formpengembalian.js"></script>
<script src="<?= base_url(); ?>assets/plugin/chosen/chosen.jquery.min.js"></script>

<script>
$('.chosen').chosen({
    width: '100%',

});
</script>

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