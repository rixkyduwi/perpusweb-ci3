<head>
    <link href="https://rizky-phb.github.io/deploy_template/custom/assets/libs/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="https://rizky-phb.github.io/deploy_template/custom/dist/css/style.min.css" rel="stylesheet">
</head>
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <form action="<?= base_url('denda/save') ?>" method="POST" id="dendaForm">
            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <div class="d-sm-flex">
                    <h1 class="h2 mb-0 text-gray-800">Ubah Denda</h1>
                </div>
                <button type="submit" class="btn btn-success btn-md btn-icon-split">
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
                                    <?php $no=1; foreach ($denda as $i): ?>
                                    <li class="dd-item dd3-item" data-id="<?= $i->id ?>">
                                        <div class="dd-handle dd3-handle"></div>
                                        <div class="dd3-content"><?= $i->amount ?></div>
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
                            </div>
                            <input type="hidden" name="nestable" id="nestableData">
                            <br>
                            <button type="submit" class="btn btn-success btn-md btn-icon-split">
                                <span class="text text-white">Simpan Perubahan</span>
                                <span class="icon text-white-50">
                                    <i class="fas fa-save"></i>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
            $('#dendaForm').on('submit', function (e) {
                e.preventDefault();
                
                var newAmount = $('#newAmount').val();
                if (!newAmount) {
                    alert('Please enter a denda amount.');
                    return;
                }

                // Append new item to the list
                var newItemId = Date.now(); // Generate a unique ID
                var newItemHtml = `<li class="dd-item dd3-item" data-id="${newItemId}">
                                        <div class="dd-handle dd3-handle"></div>
                                        <div class="dd3-content">${newAmount}</div>
                                    </li>`;
                $('#nestable2 .dd-list').prepend(newItemHtml);

                // Clear input field
                $('#newAmount').val('');

                // Trigger change event to update the hidden input
                $('#nestable2').trigger('change');
            });
        });
    </script>
</body>
</html>
