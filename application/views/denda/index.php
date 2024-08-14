<head>
    <link href="https://rizky-phb.github.io/deploy_template/custom/assets/libs/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="https://rizky-phb.github.io/deploy_template/custom/dist/css/style.min.css" rel="stylesheet">
</head>

<body>
    <!-- Begin Page Content -->
    <div class="container-fluid">
            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <div class="d-sm-flex">
                    <h1 class="h2 mb-0 text-gray-800">Ubah Denda</h1>
                </div>
                <button type="button" id="simpan_perubahan" class="btn btn-success btn-md btn-icon-split">
                    <span class="text text-white">Simpan Perubahan</span>
                    <span class="icon text-white-50">
                        <i class="fas fa-save"></i>
                    </span>
                </button>
            </div>

            <div class="d-sm-flex justify-content-between mb-0">
                <div class="col-lg-6 col-md-12">
                    <div class="card border-bottom-primary shadow mb-4">
                        <div class="title-part-padding">
                            <h4 class="card-title mb-0">Pilih Denda</h4>
                            <p>Pilihan denda paling atas adalah yang dipake</p>
                        </div>
                        <div class="card-body">
                            <div class="myadmin-dd-empty dd" id="nestable2">
                              <ol class="dd-list">
                                  <?php foreach ($denda as $i): ?>
                                  <li class="dd-item dd3-item" data-id="<?= $i->id ?>">
                                  <div class="dd-handle dd3-handle"></div>
                                      <div class="dd3-content d-flex justify-content-between align-items-center">
                                          <span><?= $i->amount ?></span>
                                          <span class="badge badge-<?= $i->status ? 'success' : 'secondary' ?>">
                                              <?= $i->status ? 'Aktif' : 'Tidak Aktif' ?>
                                          </span>
                                      </div>
                                  </li>
                                  <?php endforeach ?>
                              </ol>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-12">
                    <!-- form -->
                    <div class="card border-bottom-primary shadow mb-4">
                        <div class="card-header py-3 bg-primary">
                            <h6 class="m-0 font-weight-bold text-white">Set Denda Baru</h6>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Denda</label>
                                <input class="form-control" name="amount" type="number" id="newAmount" placeholder="Masukkan jumlah denda">
                                <button type="button" id="add_denda" class="btn btn-submit btn-success mt-4">submit</button>
                            </div>
                            <input type="hidden" name="nestable" id="nestableData">
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <!-- /.container-fluid -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; PUSTAKAGAMA 2023 </span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Anda ingin logout?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Batal</button>
                <a class="btn btn-primary" href="<?= base_url() ?>login/logout">Iya</a>
            </div>
        </div>
    </div>
</div>

<!-- Comming Soon Modal-->
<div class="modal fade" id="comingSoon" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ups!</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Kami masih memerlukan waktu untuk fitur ini.</div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
    <!-- Include scripts -->
    <script src="https://rizky-phb.github.io/deploy_template/custom/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="https://rizky-phb.github.io/deploy_template/custom/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://rizky-phb.github.io/deploy_template/custom/assets/libs/nestable/jquery.nestable.js"></script>
    <script src="<?= base_url(); ?>assets/js/login.js"></script>
    <script src="<?= base_url(); ?>assets/js/alll.js"></script>
    <script src="<?= base_url(); ?>assets/sweetalert2/dist/sweetalert2.all.min.js"></script>
 
    <script>
        $(function () {
            // Initialize Nestable
            var updateOutput = function (e) {
                var list = e.length ? e : $(e.target),
                    output = list.data("output");
                if (window.JSON) {
                    output.val(window.JSON.stringify(list.nestable("serialize")));
                } else {
                    output.val("JSON browser support required for this demo.");
                }
            };

            $("#nestable2")
                .nestable({
                    group: 1
                })
                .on("change", updateOutput);

            updateOutput($("#nestable2").data("output", $("#nestableData")));

            // Add new item on form submission
            $('#add_denda').on('click', function (e) {
                
                var formData = {
    amount: $("input[name='amount']").val(),
                }


    $.ajax({
        url: '<?= base_url('denda/tambah_proses') ?>',
        type: 'POST',
        data: formData,
        success: function (response) {
            Swal.fire({
                title: 'Berhasil!',
                text: 'Perubahan denda telah disimpan.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then(function() {
                location.reload(); // Reload halaman setelah berhasil menyimpan
            });
        },
        error: function (xhr, status, error) {
            Swal.fire({
                title: 'Gagal!',
                text: 'Terjadi kesalahan saat menyimpan perubahan.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        }
    });
            });
            $('#simpan_perubahan').on('click', function (e) {
    // Ambil data serialized dari Nestable
    var serializedData = $('#nestable2').nestable('serialize');

    // Iterate over serialized data and set statuses
    for (var i = 0; i < serializedData.length; i++) {
        if (i === 0) {
            // Set status to 1 for the top item
            serializedData[i].status = 1;
        } else {
            // Set status to 0 for other items
            serializedData[i].status = 0;
        }
    }

    // Update hidden input with the serialized data
    $('#nestableData').val(JSON.stringify(serializedData));
    var formData = {
    nestable: JSON.stringify(serializedData),
    csrf_token_name: '<?= $this->security->get_csrf_hash(); ?>'
};


    $.ajax({
        url: '<?= base_url('denda/save') ?>',
        type: 'POST',
        data: formData,
        success: function (response) {
            Swal.fire({
                title: 'Berhasil!',
                text: 'Perubahan denda telah disimpan.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then(function() {
                
                location.reload(); // Reload halaman setelah berhasil menyimpan
            });
        },
        error: function (xhr, status, error) {
            Swal.fire({
                title: 'Gagal!',
                text: 'Terjadi kesalahan saat menyimpan perubahan.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        }
    });
});

        });
    </script>
    
    <!-- Additional Scripts -->
    <script src="<?= base_url(); ?>assets/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?= base_url(); ?>assets/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="<?= base_url(); ?>assets/sbadmin/js/sb-admin-2.min.js"></script>
    <script src="<?= base_url(); ?>assets/sbadmin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<?= base_url(); ?>assets/sbadmin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="<?= base_url(); ?>assets/sbadmin/js/demo/datatables-demo.js"></script>
</body>
</html>
