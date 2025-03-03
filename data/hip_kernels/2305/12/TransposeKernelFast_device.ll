; ModuleID = '../data/hip_kernels/2305/12/main.cu'
source_filename = "../data/hip_kernels/2305/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19TransposeKernelFastPKhPhiiE4sbuf = internal unnamed_addr addrspace(3) global [16 x [20 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19TransposeKernelFastPKhPhii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add nsw i32 %13, %5
  %21 = add nsw i32 %19, %6
  %22 = icmp slt i32 %20, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %32

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %2
  %27 = add nsw i32 %26, %20
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !6
  %31 = getelementptr inbounds [16 x [20 x i8]], [16 x [20 x i8]] addrspace(3)* @_ZZ19TransposeKernelFastPKhPhiiE4sbuf, i32 0, i32 %6, i32 %5
  store i8 %30, i8 addrspace(3)* %31, align 1, !tbaa !7
  br label %32

32:                                               ; preds = %25, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = add nsw i32 %13, %6
  %34 = add nsw i32 %19, %5
  %35 = icmp slt i32 %33, %2
  %36 = icmp slt i32 %34, %3
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %45

38:                                               ; preds = %32
  %39 = getelementptr inbounds [16 x [20 x i8]], [16 x [20 x i8]] addrspace(3)* @_ZZ19TransposeKernelFastPKhPhiiE4sbuf, i32 0, i32 %5, i32 %6
  %40 = load i8, i8 addrspace(3)* %39, align 1, !tbaa !7
  %41 = mul nsw i32 %33, %3
  %42 = add nsw i32 %34, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %43
  store i8 %40, i8 addrspace(1)* %44, align 1, !tbaa !7
  br label %45

45:                                               ; preds = %38, %32
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
