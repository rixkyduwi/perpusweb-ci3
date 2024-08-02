<!-- Begin Page Content -->
<div class="container-fluid">

    <form action="<?= base_url() ?>denda/update" name="myForm" method="POST" 
        onsubmit="return validateForm()">

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
            <div class="col-lg-8 mb-4">
                <!-- form -->
                <div class="card border-bottom-primary shadow mb-4">
                    <div class="card-header py-3 bg-primary">
                        <h6 class="m-0 font-weight-bold text-white">Form Ubah Denda</h6>
                    </div>
                    <div class="card-body">
                        <div class="col-lg-12">
                            <div class="form-group"><label>Denda</label>
                                <input class="form-control" name="amount" type="number" value="<?= $denda->amount ?>">
                            </div>
                        <br>
                    </div>
                    <div class="col-lg-12 col-md-12">
                   <div class="myadmin-dd dd text-black col-12" id="nestable">
                     <ol class="dd-list col-12">
                       {% for i in urutan_jabatan :%}
                       <li class="dd-item col-12" data-id="{{i}}">
                         <div class="dd-handle col-12">{{i}}</div>
                       </li>
                       {% endfor %}
                       
                         </ol>
                       </li>
                     </ol>
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
<script src="<?= base_url(); ?>assets/js/anggota.js"></script>
<script src="<?= base_url(); ?>assets/js/validasi/formanggota.js"></script>
<script src="<?= base_url(); ?>assets/plugin/datepicker/dist/js/bootstrap-datepicker.min.js"></script>


<?php if($this->session->flashdata('Pesan')): ?>

<?php else: ?>
<script>
$(document).ready(function() {

    $('#pdf').hide();

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
<script src="../../static/assets/libs/nestable/jquery.nestable.js"></script>
  <script>
    $(function () {
      // Nestable
      var updateOutput = function (e) {
        var list = e.length ? e : $(e.target),
          output = list.data("output");
        if (window.JSON) {
          output.val(window.JSON.stringify(list.nestable("serialize"))); //, null, 2));
        } else {
          output.val("JSON browser support required for this demo.");
        }
      };

      $("#nestable")
        .nestable({
          group: 1,
        })
        .on("change", updateOutput);

      $("#nestable2")
        .nestable({
          group: 1,
        })
        .on("change", updateOutput);

      updateOutput($("#nestable").data("output", $("#nestable-output")));
      updateOutput($("#nestable2").data("output", $("#nestable2-output")));

      $("#nestable-menu").on("click", function (e) {
        var target = $(e.target),
          action = target.data("action");
        if (action === "expand-all") {
          $(".dd").nestable("expandAll");
        }
        if (action === "collapse-all") {
          $(".dd").nestable("collapseAll");
        }
      });

      $("#nestable-menu").nestable();
    });
  </script>
<?php endif; ?>