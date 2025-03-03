; ModuleID = '../data/hip_kernels/11810/52/main.cu'
source_filename = "../data/hip_kernels/11810/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z31ApplySubKeplerianBoundaryKernelPdS_diidd(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double %2, i32 %3, i32 %4, double %5, double %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %3
  br i1 %17, label %18, label %34

18:                                               ; preds = %7
  %19 = load double, double addrspace(1)* %1, align 8, !tbaa !7, !amdgpu.noclobber !6
  %20 = fmul contract double %19, %2
  %21 = fsub contract double %5, %20
  %22 = sext i32 %16 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %0, i64 %22
  store double %21, double addrspace(1)* %23, align 8, !tbaa !7
  %24 = add nsw i32 %4, -1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %1, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7
  %28 = fmul contract double %27, %2
  %29 = fsub contract double %6, %28
  %30 = mul nsw i32 %24, %3
  %31 = add nsw i32 %16, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  store double %29, double addrspace(1)* %33, align 8, !tbaa !7
  br label %34

34:                                               ; preds = %7, %18
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
