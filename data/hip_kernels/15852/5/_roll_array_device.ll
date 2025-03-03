; ModuleID = '../data/hip_kernels/15852/5/main.cu'
source_filename = "../data/hip_kernels/15852/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11_roll_arrayPKfPKlPfiii(float addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = mul i32 %5, %4
  %17 = mul i32 %16, %3
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %19, label %45

19:                                               ; preds = %6
  %20 = sdiv i32 %15, %16
  %21 = mul i32 %16, %20
  %22 = sub nsw i32 %15, %21
  %23 = sdiv i32 %22, %5
  %24 = srem i32 %15, %5
  %25 = mul nsw i32 %23, %5
  %26 = add nsw i32 %21, %25
  %27 = add nsw i32 %26, %24
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = sext i32 %21 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = sext i32 %20 to i64
  %34 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %33
  %35 = load i64, i64 addrspace(1)* %34, align 8, !tbaa !11, !amdgpu.noclobber !6
  %36 = trunc i64 %35 to i32
  %37 = add nsw i32 %23, %36
  %38 = srem i32 %37, %4
  %39 = add nsw i32 %38, %4
  %40 = srem i32 %39, %4
  %41 = mul nsw i32 %40, %5
  %42 = add nsw i32 %41, %24
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %32, i64 %43
  store float %30, float addrspace(1)* %44, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %6, %19
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !9, i64 0}
