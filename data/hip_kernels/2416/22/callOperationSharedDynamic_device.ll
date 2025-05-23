; ModuleID = '../data/hip_kernels/2416/22/main.cu'
source_filename = "../data/hip_kernels/2416/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@data = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26callOperationSharedDynamicPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %17, label %35

17:                                               ; preds = %6
  %18 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @data, i32 0, i32 %5
  %19 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %5
  %20 = sext i32 %15 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @data, i32 0, i32 %15
  store i32 %22, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = getelementptr inbounds i32, i32 addrspace(3)* %18, i32 %15
  store i32 %25, i32 addrspace(3)* %26, align 4, !tbaa !7
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %20
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = getelementptr inbounds i32, i32 addrspace(3)* %19, i32 %15
  store i32 %28, i32 addrspace(3)* %29, align 4, !tbaa !7
  %30 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !7
  %31 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !7
  %32 = add nsw i32 %31, %30
  %33 = icmp sgt i32 %32, %3
  %34 = select i1 %33, i32 %4, i32 %32
  store i32 %34, i32 addrspace(3)* %29, align 4
  store i32 %34, i32 addrspace(1)* %27, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %6, %17
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
