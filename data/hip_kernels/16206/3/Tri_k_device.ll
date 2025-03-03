; ModuleID = '../data/hip_kernels/16206/3/main.cu'
source_filename = "../data/hip_kernels/16206/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z5Tri_kPfS_S_fi(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = freeze i32 %6
  %8 = freeze i32 %4
  %9 = udiv i32 %7, %8
  %10 = mul i32 %9, %8
  %11 = sub i32 %7, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %17, %4
  %19 = mul i32 %18, %12
  %20 = add i32 %19, %9
  %21 = sitofp i32 %11 to float
  %22 = fadd contract float %21, 1.000000e+00
  %23 = fdiv contract float %22, %3
  %24 = mul nsw i32 %20, %4
  %25 = add nsw i32 %24, %11
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %23, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = icmp ne i32 %11, 0
  %29 = add nsw i32 %4, -1
  %30 = icmp slt i32 %11, %29
  %31 = select i1 %28, i1 %30, i1 false
  br i1 %31, label %32, label %36

32:                                               ; preds = %5
  %33 = fmul contract float %3, 3.000000e+00
  %34 = fdiv contract float %22, %33
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  store float %34, float addrspace(1)* %35, align 4, !tbaa !7
  br label %39

36:                                               ; preds = %5
  %37 = icmp eq i32 %11, 0
  %38 = select i1 %37, float addrspace(1)* %0, float addrspace(1)* %2
  br label %39

39:                                               ; preds = %36, %32
  %40 = phi float addrspace(1)* [ %2, %32 ], [ %38, %36 ]
  %41 = phi float [ %34, %32 ], [ 0.000000e+00, %36 ]
  %42 = getelementptr inbounds float, float addrspace(1)* %40, i64 %26
  store float %41, float addrspace(1)* %42, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
