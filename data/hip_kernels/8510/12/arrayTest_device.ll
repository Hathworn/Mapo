; ModuleID = '../data/hip_kernels/8510/12/main.cu'
source_filename = "../data/hip_kernels/8510/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9arrayTestiPlS_S_PiS_(i32 %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readnone %4, i64 addrspace(1)* nocapture readnone %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %41

17:                                               ; preds = %6
  %18 = mul nsw i32 %15, 3
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %19
  %21 = load i64, i64 addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %22
  %24 = load i64, i64 addrspace(1)* %23, align 8, !tbaa !7, !amdgpu.noclobber !5
  %25 = mul nsw i64 %24, %21
  %26 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %19
  store i64 %25, i64 addrspace(1)* %26, align 8, !tbaa !7
  %27 = add nsw i32 %18, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %28
  %30 = load i64, i64 addrspace(1)* %29, align 8, !tbaa !7
  %31 = load i64, i64 addrspace(1)* %23, align 8, !tbaa !7
  %32 = mul nsw i64 %31, %30
  %33 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %28
  store i64 %32, i64 addrspace(1)* %33, align 8, !tbaa !7
  %34 = add nsw i32 %18, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %35
  %37 = load i64, i64 addrspace(1)* %36, align 8, !tbaa !7
  %38 = load i64, i64 addrspace(1)* %23, align 8, !tbaa !7
  %39 = mul nsw i64 %38, %37
  %40 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %35
  store i64 %39, i64 addrspace(1)* %40, align 8, !tbaa !7
  br label %41

41:                                               ; preds = %17, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
