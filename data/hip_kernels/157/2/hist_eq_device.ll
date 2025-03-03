; ModuleID = '../data/hip_kernels/157/2/main.cu'
source_filename = "../data/hip_kernels/157/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7hist_eqPhPfS0_fi(i8 addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %6, %12
  %14 = add i32 %13, %7
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %35

16:                                               ; preds = %5
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %17
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !7, !amdgpu.noclobber !6
  %20 = zext i8 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !10, !amdgpu.noclobber !6
  %23 = fsub contract float %22, %3
  %24 = fmul contract float %23, 2.550000e+02
  %25 = fsub contract float 1.000000e+00, %3
  %26 = fdiv contract float %24, %25
  %27 = fpext float %26 to double
  %28 = tail call double @llvm.maxnum.f64(double %27, double 0.000000e+00)
  %29 = tail call double @llvm.minnum.f64(double %28, double 2.550000e+02)
  %30 = fptoui double %29 to i8
  store i8 %30, i8 addrspace(1)* %18, align 1, !tbaa !7
  %31 = uitofp i8 %30 to double
  %32 = fdiv contract double %31, 2.550000e+02
  %33 = fptrunc double %32 to float
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  store float %33, float addrspace(1)* %34, align 4, !tbaa !10
  br label %35

35:                                               ; preds = %16, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
