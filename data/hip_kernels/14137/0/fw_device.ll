; ModuleID = '../data/hip_kernels/14137/0/main.cu'
source_filename = "../data/hip_kernels/14137/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z2fwPfPiii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = bitcast i8 addrspace(4)* %7 to <2 x i16> addrspace(4)*
  %12 = load <2 x i16>, <2 x i16> addrspace(4)* %11, align 4, !invariant.load !5
  %13 = zext <2 x i16> %12 to <2 x i32>
  %14 = insertelement <2 x i32> poison, i32 %6, i64 0
  %15 = insertelement <2 x i32> %14, i32 %9, i64 1
  %16 = mul <2 x i32> %15, %13
  %17 = insertelement <2 x i32> poison, i32 %8, i64 0
  %18 = insertelement <2 x i32> %17, i32 %10, i64 1
  %19 = add <2 x i32> %16, %18
  %20 = shufflevector <2 x i32> %19, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %21 = extractelement <2 x i32> %19, i64 0
  %22 = icmp slt i32 %21, %3
  %23 = extractelement <2 x i32> %19, i64 1
  %24 = icmp slt i32 %23, %3
  %25 = select i1 %22, i1 %24, i1 false
  br i1 %25, label %26, label %42

26:                                               ; preds = %4
  %27 = mul nsw i32 %23, %3
  %28 = add nsw i32 %27, %2
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !6, !amdgpu.noclobber !5
  %32 = mul nsw i32 %3, %2
  %33 = add nsw i32 %21, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !6, !amdgpu.noclobber !5
  %37 = fadd contract float %31, %36
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !10, !amdgpu.noclobber !5
  %40 = sitofp i32 %39 to float
  %41 = fptosi float %40 to i32
  br label %42

42:                                               ; preds = %26, %4
  %43 = phi float [ %37, %26 ], [ undef, %4 ]
  %44 = phi i32 [ %41, %26 ], [ undef, %4 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = insertelement <4 x i32> <i32 poison, i32 poison, i32 0, i32 0>, i32 %3, i64 0
  %46 = insertelement <4 x i32> %45, i32 %3, i64 1
  %47 = icmp sgt <4 x i32> %20, %46
  %48 = icmp eq <4 x i32> %20, %46
  %49 = shufflevector <4 x i1> %47, <4 x i1> %48, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %50 = freeze <4 x i1> %49
  %51 = bitcast <4 x i1> %50 to i4
  %52 = icmp eq i4 %51, 0
  br i1 %52, label %53, label %62

53:                                               ; preds = %42
  %54 = mul nsw i32 %23, %3
  %55 = add nsw i32 %54, %21
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !6, !amdgpu.noclobber !5
  %59 = fcmp contract olt float %43, %58
  br i1 %59, label %60, label %62

60:                                               ; preds = %53
  store float %43, float addrspace(1)* %57, align 4, !tbaa !6
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  store i32 %44, i32 addrspace(1)* %61, align 4, !tbaa !10
  br label %62

62:                                               ; preds = %53, %60, %42
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
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
