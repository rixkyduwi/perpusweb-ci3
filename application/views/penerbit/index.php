<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Data Penerbit</h1>
        <?php if ($this->session->userdata('level') == 'admin'): ?>
            <a href="" data-toggle="modal" data-target="#form" class="btn btn-sm btn-primary btn-icon-split">
                <span class="text text-white">Tambah Data</span>
                <span class="icon text-white-50">
                    <i class="fas fa-plus"></i>
                </span>
            </a>
        <?php endif; ?>
    </div>

    <div class="col-lg-12 mb-4" id="container">

        <!-- Illustrations -->
        <div class="card border-bottom-primary shadow mb-4">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table" id="dtHorizontalExample" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th width="1%">No</th>
                                <th>Penerbit</th>
                                <th>Keterangan</th>
                                <th>Link Website Penerbit Buku</th>
                                <th>Judul Buku</th>
                                <th>Setiap Tahun Buku Terbit</th>
                                <th>Link Buku</th>
                                <th>Kategori Penerbit</th>
                                <?php if ($this->session->userdata('level') == 'admin'): ?>
                                    <th width="1%">Aksi</th>
                                <?php endif; ?>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <?php $no = 1;
                            foreach ($penerbit as $p): ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $p->penerbit ?: '<i>(Tidak diisi)</i>' ?></td>
                                    <td><?= $p->keterangan ?: '<i>(Tidak diisi)</i>' ?></td>
                                    <td><a href="<?= $p->link ?>"><?= $p->link ?></a></td>
                                    <td><?= $p->judul ?></td>
                                    <td><?= $p->tahun_terbit ?></td>
                                    <td><a href="<?= $p->link_buku ?>"><?= $p->link_buku ?></a></td>
                                    <td><?= $p->kategori_penerbit ?></td>
                                    <?php if ($this->session->userdata('level') == 'admin'): ?>
                                        <td>
                                            <center>
                                                <a href="#" data-toggle="modal" data-target="#formU"
                                                   onclick="ambilData('<?= $p->id_penerbit ?>')"
                                                   class="btn btn-circle btn-success btn-sm">
                                                    <i class="fas fa-pen"></i>
                                                </a>
                                                <a href="#" onclick="konfirmasi('<?= $p->id_penerbit ?>')"
                                                   class="btn btn-circle btn-danger btn-sm">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </center>
                                        </td>
                                    <?php endif; ?>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

</div>
<!-- /.container-fluid -->

<!-- Form input-->
<div class="modal fade" id="form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="<?= base_url() ?>penerbit/proses_tambah" name="myForm" method="POST" onsubmit="return validateForm()">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title text-white font-weight-bold" id="exampleModalLabel">Tambah Penerbit</h5>
                    <button class="close text-white" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>

                <div class="col-lg-12">
                    <br>
                    <div class="form-group"><label>Nama Penerbit</label>
                        <input class="form-control" name="penerbit" type="text" placeholder="Masukkan nama penerbit">
                    </div>

                    <div class="form-group"><label>Keterangan</label>
                        <textarea class="form-control" name="ket"></textarea>
                    </div>

                    <div class="form-group"><label>Link Website Penerbit</label>
                        <input class="form-control" name="link" type="text" placeholder="https://">
                    </div>

                    <div class="form-group"><label>Judul Buku</label>
                        <input class="form-control" name="judul" type="text" placeholder="Masukkan judul buku">
                    </div>

                    <div class="form-group"><label>Setiap Tahun Buku Terbit</label>
                        <select class="form-control" name="tahun_terbit">
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>

                    <div class="form-group"><label>Link Buku</label>
                        <input class="form-control" name="link_buku" type="text" placeholder="Masukkan link buku">
                    </div>

                    <div class="form-group"><label>Kategori Penerbit</label>
                        <select class="form-control" name="kategori_penerbit">
                            <option value="">a</option>
                            <option value="b">b</option>
                            <option value="c">c</option>
                            <option value="d">d</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-icon-split">
                        <span class="icon text-white-50">
                            <i class="fas fa-save"></i>
                        </span>
                        <span class="text text-white">Simpan Data</span>
                    </button>
                    <button type="button" class="btn btn-secondary btn-icon-split" data-dismiss="modal">
                        <span class="icon text-white-50">
                            <i class="fas fa-times"></i>
                        </span>
                        <span class="text text-white">Batal</span>
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Form Ubah-->
<div class="modal fade" id="formU" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="<?= base_url() ?>penerbit/proses_ubah" name="myFormUpdate" method="POST" onsubmit="return validateFormUpdate()">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success">
                    <h5 class="modal-title text-white font-weight-bold" id="exampleModalLabel">Ubah Penerbit</h5>
                    <button class="close text-white" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>

                <div class="col-lg-12">
                    <br>
                    <div class="form-group"><label>Nama Penerbit</label>
                        <input type="hidden" id="id" name="id">
                        <input class="form-control" name="penerbit" id="penerbit" type="text" placeholder="">
                    </div>

                    <div class="form-group"><label>Keterangan</label>
                        <textarea class="form-control" name="ket" id="ket"></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-icon-split">
                        <span class="icon text-white-50">
                            <i class="fas fa-save"></i>
                        </span>
                        <span class="text text-white">Simpan Perubahan</span>
                    </button>
                    <button type="button" class="btn btn-danger btn-icon-split" data-dismiss="modal">
                        <span class="icon text-white-50">
                            <i class="fas fa-times"></i>
                        </span>
                        <span class="text text-white">Batal</span>
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="<?= base_url(); ?>assets/js/jquery.min.js"></script>
<script src="<?= base_url(); ?>assets/js/penerbit.js"></script>
<script src="<?= base_url(); ?>assets/js/validasi/formpenerbit.js"></script>
<?php if ($this->session->flashdata('Pesan')): ?>
    <?= $this->session->flashdata('Pesan') ?>
<?php else: ?>
    <script>
        $(document).ready(function () {
            let timerInterval;
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
                // Handle result if needed
            });
        });
    </script>
<?php endif; ?>
