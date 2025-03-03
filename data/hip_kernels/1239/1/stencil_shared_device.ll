; ModuleID = '../data/hip_kernels/1239/1/main.cu'
source_filename = "../data/hip_kernels/1239/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14stencil_sharedPiS_E4temp = internal unnamed_addr addrspace(3) global [1030 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14stencil_sharedPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = add nuw nsw i32 %3, 3
  %13 = add nsw i32 %11, 3
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %12
  store i32 %16, i32 addrspace(3)* %17, align 4, !tbaa !7
  %18 = icmp ult i32 %3, 3
  %19 = sext i32 %11 to i64
  br i1 %18, label %20, label %30

20:                                               ; preds = %2
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %3
  store i32 %22, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nsw i32 %11, 1027
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add nuw nsw i32 %3, 1027
  %29 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %28
  store i32 %27, i32 addrspace(3)* %29, align 4, !tbaa !7
  br label %30

30:                                               ; preds = %2, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %3
  %32 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !7
  %33 = add nuw nsw i32 %3, 1
  %34 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %33
  %35 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !7
  %36 = add nsw i32 %35, %32
  %37 = add nuw nsw i32 %3, 2
  %38 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !7
  %40 = add nsw i32 %39, %36
  %41 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %42 = add nsw i32 %41, %40
  %43 = add nuw nsw i32 %3, 4
  %44 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %43
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !7
  %46 = add nsw i32 %45, %42
  %47 = add nuw nsw i32 %3, 5
  %48 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %49, %46
  %51 = add nuw nsw i32 %3, 6
  %52 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ14stencil_sharedPiS_E4temp, i32 0, i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %53, %50
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
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
