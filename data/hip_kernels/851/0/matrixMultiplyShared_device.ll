; ModuleID = '../data/hip_kernels/851/0/main.cu'
source_filename = "../data/hip_kernels/851/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16
@_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20matrixMultiplySharedPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 %25
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 %17, i32 %25
  store float 0.000000e+00, float addrspace(3)* %28, align 4, !tbaa !7
  %29 = icmp slt i32 %4, 0
  br i1 %29, label %40, label %30

30:                                               ; preds = %9
  %31 = add nsw i32 %4, -1
  %32 = sdiv i32 %31, 2
  %33 = icmp slt i32 %18, %3
  %34 = mul nsw i32 %18, %4
  %35 = icmp slt i32 %26, %6
  %36 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 0
  %37 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 0, i32 %25
  %38 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sA, i32 0, i32 %17, i32 1
  %39 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ20matrixMultiplySharedPfS_S_iiiiiiE2sB, i32 0, i32 1, i32 %25
  br label %45

40:                                               ; preds = %69, %9
  %41 = phi float [ 0.000000e+00, %9 ], [ %78, %69 ]
  %42 = icmp slt i32 %18, %7
  %43 = icmp slt i32 %26, %8
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %81, label %86

45:                                               ; preds = %30, %69
  %46 = phi i32 [ 0, %30 ], [ %79, %69 ]
  %47 = phi float [ 0.000000e+00, %30 ], [ %78, %69 ]
  br i1 %33, label %48, label %57

48:                                               ; preds = %45
  %49 = shl nuw nsw i32 %46, 1
  %50 = add nuw i32 %49, %25
  %51 = icmp ult i32 %50, %4
  br i1 %51, label %52, label %57

52:                                               ; preds = %48
  %53 = add i32 %50, %34
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %45, %48, %52
  %58 = phi float [ %56, %52 ], [ 0.000000e+00, %48 ], [ 0.000000e+00, %45 ]
  store float %58, float addrspace(3)* %27, align 4, !tbaa !7
  br i1 %35, label %59, label %69

59:                                               ; preds = %57
  %60 = shl nuw nsw i32 %46, 1
  %61 = add nuw i32 %60, %17
  %62 = icmp ult i32 %61, %5
  br i1 %62, label %63, label %69

63:                                               ; preds = %59
  %64 = mul i32 %61, %6
  %65 = add i32 %64, %26
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %57, %59, %63
  %70 = phi float [ %68, %63 ], [ 0.000000e+00, %59 ], [ 0.000000e+00, %57 ]
  store float %70, float addrspace(3)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = load float, float addrspace(3)* %36, align 8, !tbaa !7
  %72 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %73 = fmul contract float %71, %72
  %74 = fadd contract float %47, %73
  %75 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %76 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %77 = fmul contract float %75, %76
  %78 = fadd contract float %74, %77
  %79 = add nuw nsw i32 %46, 1
  %80 = icmp eq i32 %46, %32
  br i1 %80, label %40, label %45, !llvm.loop !11

81:                                               ; preds = %40
  %82 = mul nsw i32 %18, %8
  %83 = add nsw i32 %82, %26
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  store float %41, float addrspace(1)* %85, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %81, %40
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
