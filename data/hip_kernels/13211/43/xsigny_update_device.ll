; ModuleID = '../data/hip_kernels/13211/43/main.cu'
source_filename = "../data/hip_kernels/13211/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13xsigny_updateiPKdPdS1_(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %34

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %2, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !6
  %19 = fcmp contract ogt double %18, 0.000000e+00
  br i1 %19, label %20, label %26

20:                                               ; preds = %15
  %21 = getelementptr inbounds double, double addrspace(1)* %1, i64 %16
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds double, double addrspace(1)* %3, i64 %16
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7, !amdgpu.noclobber !6
  %25 = fadd contract double %22, %24
  store double %25, double addrspace(1)* %23, align 8, !tbaa !7
  br label %34

26:                                               ; preds = %15
  %27 = fcmp contract olt double %18, 0.000000e+00
  br i1 %27, label %28, label %34

28:                                               ; preds = %26
  %29 = getelementptr inbounds double, double addrspace(1)* %1, i64 %16
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !6
  %31 = getelementptr inbounds double, double addrspace(1)* %3, i64 %16
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !6
  %33 = fsub contract double %32, %30
  store double %33, double addrspace(1)* %31, align 8, !tbaa !7
  br label %34

34:                                               ; preds = %20, %28, %26, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
