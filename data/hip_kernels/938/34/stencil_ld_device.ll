; ModuleID = '../data/hip_kernels/938/34/main.cu'
source_filename = "../data/hip_kernels/938/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10stencil_ldPjS_E4temp = internal unnamed_addr addrspace(3) global [7 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10stencil_ldPjS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %3
  store i32 %14, i32 addrspace(3)* %15, align 4, !tbaa !7
  %16 = icmp ult i32 %3, 3
  br i1 %16, label %20, label %17

17:                                               ; preds = %2
  %18 = add nsw i32 %3, -3
  %19 = add nuw nsw i32 %3, 1
  br label %33

20:                                               ; preds = %2
  %21 = add nsw i32 %11, -3
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = add nuw nsw i32 %3, -3
  %26 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %25
  store i32 %24, i32 addrspace(3)* %26, align 4, !tbaa !7
  %27 = add nsw i32 %11, -1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = add nuw nsw i32 %3, 1
  %32 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %31
  store i32 %30, i32 addrspace(3)* %32, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %17, %20
  %34 = phi i32 [ %19, %17 ], [ %31, %20 ]
  %35 = phi i32 [ %18, %17 ], [ %25, %20 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %35
  %37 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !7
  %38 = add nsw i32 %3, -2
  %39 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %41 = add nsw i32 %40, %37
  %42 = add nsw i32 %3, -1
  %43 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %42
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %45 = add nsw i32 %44, %41
  %46 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %47 = add nsw i32 %46, %45
  %48 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %34
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %49, %47
  %51 = add nuw nsw i32 %3, 2
  %52 = getelementptr inbounds [7 x i32], [7 x i32] addrspace(3)* @_ZZ10stencil_ldPjS_E4temp, i32 0, i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %53, %50
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  store i32 %54, i32 addrspace(1)* %55, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
