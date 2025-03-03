; ModuleID = '../data/hip_kernels/12983/14/main.cu'
source_filename = "../data/hip_kernels/12983/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12Overlay_CudaiiPhiS_iiiS_iii(i32 %0, i32 %1, i8 addrspace(1)* nocapture %2, i32 %3, i8 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i8 addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = add nsw i32 %6, %0
  %20 = add nsw i32 %7, %1
  %21 = bitcast i8 addrspace(4)* %15 to <2 x i16> addrspace(4)*
  %22 = load <2 x i16>, <2 x i16> addrspace(4)* %21, align 4, !invariant.load !5
  %23 = zext <2 x i16> %22 to <2 x i32>
  %24 = insertelement <2 x i32> poison, i32 %13, i64 0
  %25 = insertelement <2 x i32> %24, i32 %17, i64 1
  %26 = mul <2 x i32> %25, %23
  %27 = insertelement <2 x i32> poison, i32 %16, i64 0
  %28 = insertelement <2 x i32> %27, i32 %18, i64 1
  %29 = add <2 x i32> %26, %28
  %30 = shufflevector <2 x i32> %29, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %31 = insertelement <4 x i32> poison, i32 %0, i64 0
  %32 = insertelement <4 x i32> %31, i32 %1, i64 1
  %33 = insertelement <4 x i32> %32, i32 %20, i64 2
  %34 = insertelement <4 x i32> %33, i32 %19, i64 3
  %35 = icmp slt <4 x i32> %30, %34
  %36 = icmp sge <4 x i32> %30, %34
  %37 = shufflevector <4 x i1> %35, <4 x i1> %36, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %38 = freeze <4 x i1> %37
  %39 = bitcast <4 x i1> %38 to i4
  %40 = icmp eq i4 %39, 0
  br i1 %40, label %41, label %76

41:                                               ; preds = %12
  %42 = extractelement <2 x i32> %29, i64 0
  %43 = sub nsw i32 %42, %0
  %44 = extractelement <2 x i32> %29, i64 1
  %45 = sub nsw i32 %44, %1
  %46 = icmp eq i32 %9, 0
  br i1 %46, label %57, label %47

47:                                               ; preds = %41
  %48 = mul nsw i32 %43, %10
  %49 = mul i32 %11, %9
  %50 = mul i32 %49, %45
  %51 = add nsw i32 %50, %48
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %52
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !6, !amdgpu.noclobber !5
  %55 = uitofp i8 %54 to float
  %56 = fdiv contract float %55, 2.550000e+02
  br label %57

57:                                               ; preds = %47, %41
  %58 = phi float [ %56, %47 ], [ 1.000000e+00, %41 ]
  %59 = mul nsw i32 %45, %5
  %60 = add nsw i32 %59, %43
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !6, !amdgpu.noclobber !5
  %64 = uitofp i8 %63 to float
  %65 = fmul contract float %58, %64
  %66 = fsub contract float 1.000000e+00, %58
  %67 = mul nsw i32 %44, %3
  %68 = add nsw i32 %67, %42
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !6, !amdgpu.noclobber !5
  %72 = uitofp i8 %71 to float
  %73 = fmul contract float %66, %72
  %74 = fadd contract float %65, %73
  %75 = fptoui float %74 to i8
  store i8 %75, i8 addrspace(1)* %70, align 1, !tbaa !6
  br label %76

76:                                               ; preds = %12, %57
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
