; ModuleID = '../data/hip_kernels/16910/27/main.cu'
source_filename = "../data/hip_kernels/16910/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5max1DPKdPKfPfE5sdata = internal addrspace(3) global [1105 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5max1DPKdPKfPf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %5 = fptosi double %4 to i32
  %6 = getelementptr inbounds double, double addrspace(1)* %0, i64 3
  %7 = load double, double addrspace(1)* %6, align 8, !tbaa !4, !amdgpu.noclobber !8
  %8 = fptosi double %7 to i32
  %9 = getelementptr inbounds double, double addrspace(1)* %0, i64 5
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !4, !amdgpu.noclobber !8
  %11 = fptrunc double %10 to float
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %13 = add nsw i32 %5, -1024
  %14 = sub i32 %13, %8
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %101, label %16

16:                                               ; preds = %3
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = icmp slt i32 %12, %8
  %19 = mul nsw i32 %17, %5
  %20 = add i32 %19, %12
  %21 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ5max1DPKdPKfPfE5sdata, i32 0, i32 %12
  %22 = addrspacecast float addrspace(3)* %21 to float*
  %23 = add i32 %12, %8
  %24 = add i32 %23, %19
  %25 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ5max1DPKdPKfPfE5sdata, i32 0, i32 %23
  %26 = addrspacecast float addrspace(3)* %25 to float*
  %27 = icmp sgt i32 %8, 0
  %28 = and i32 %8, 3
  %29 = icmp ult i32 %8, 4
  %30 = and i32 %8, -4
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %16, %98
  %33 = phi i32 [ 0, %16 ], [ %99, %98 ]
  br i1 %18, label %34, label %39

34:                                               ; preds = %32
  %35 = add i32 %20, %33
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !10
  store volatile float %38, float* %22, align 4, !tbaa !10
  br label %39

39:                                               ; preds = %34, %32
  %40 = add i32 %24, %33
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !10
  store volatile float %43, float* %26, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %27, label %44, label %91

44:                                               ; preds = %39
  br i1 %29, label %75, label %45

45:                                               ; preds = %44, %45
  %46 = phi float [ %71, %45 ], [ 0.000000e+00, %44 ]
  %47 = phi i32 [ %72, %45 ], [ 0, %44 ]
  %48 = phi i32 [ %73, %45 ], [ 0, %44 ]
  %49 = add nuw nsw i32 %47, %12
  %50 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ5max1DPKdPKfPfE5sdata, i32 0, i32 %49
  %51 = addrspacecast float addrspace(3)* %50 to float*
  %52 = load volatile float, float* %51, align 4, !tbaa !10
  %53 = tail call float @llvm.maxnum.f32(float %46, float %52)
  %54 = or i32 %47, 1
  %55 = add nuw nsw i32 %54, %12
  %56 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ5max1DPKdPKfPfE5sdata, i32 0, i32 %55
  %57 = addrspacecast float addrspace(3)* %56 to float*
  %58 = load volatile float, float* %57, align 4, !tbaa !10
  %59 = tail call float @llvm.maxnum.f32(float %53, float %58)
  %60 = or i32 %47, 2
  %61 = add nuw nsw i32 %60, %12
  %62 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ5max1DPKdPKfPfE5sdata, i32 0, i32 %61
  %63 = addrspacecast float addrspace(3)* %62 to float*
  %64 = load volatile float, float* %63, align 4, !tbaa !10
  %65 = tail call float @llvm.maxnum.f32(float %59, float %64)
  %66 = or i32 %47, 3
  %67 = add nuw nsw i32 %66, %12
  %68 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ5max1DPKdPKfPfE5sdata, i32 0, i32 %67
  %69 = addrspacecast float addrspace(3)* %68 to float*
  %70 = load volatile float, float* %69, align 4, !tbaa !10
  %71 = tail call float @llvm.maxnum.f32(float %65, float %70)
  %72 = add nuw nsw i32 %47, 4
  %73 = add i32 %48, 4
  %74 = icmp eq i32 %73, %30
  br i1 %74, label %75, label %45, !llvm.loop !12

75:                                               ; preds = %45, %44
  %76 = phi float [ undef, %44 ], [ %71, %45 ]
  %77 = phi float [ 0.000000e+00, %44 ], [ %71, %45 ]
  %78 = phi i32 [ 0, %44 ], [ %72, %45 ]
  br i1 %31, label %91, label %79

79:                                               ; preds = %75, %79
  %80 = phi float [ %87, %79 ], [ %77, %75 ]
  %81 = phi i32 [ %88, %79 ], [ %78, %75 ]
  %82 = phi i32 [ %89, %79 ], [ 0, %75 ]
  %83 = add nuw nsw i32 %81, %12
  %84 = getelementptr inbounds [1105 x float], [1105 x float] addrspace(3)* @_ZZ5max1DPKdPKfPfE5sdata, i32 0, i32 %83
  %85 = addrspacecast float addrspace(3)* %84 to float*
  %86 = load volatile float, float* %85, align 4, !tbaa !10
  %87 = tail call float @llvm.maxnum.f32(float %80, float %86)
  %88 = add nuw nsw i32 %81, 1
  %89 = add nuw nsw i32 %82, 1
  %90 = icmp eq i32 %89, %28
  br i1 %90, label %91, label %79, !llvm.loop !15

91:                                               ; preds = %79, %75, %39
  %92 = phi float [ 0.000000e+00, %39 ], [ %76, %75 ], [ %87, %79 ]
  %93 = fcmp contract ogt float %92, %11
  br i1 %93, label %94, label %98

94:                                               ; preds = %91
  %95 = add i32 %20, %33
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %96
  store float %92, float addrspace(1)* %97, align 4, !tbaa !10
  br label %98

98:                                               ; preds = %94, %91
  %99 = add nuw nsw i32 %33, 1024
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %100 = icmp sgt i32 %99, %14
  br i1 %100, label %101, label %32, !llvm.loop !16

101:                                              ; preds = %98, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !6, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !13}
