; ModuleID = '../data/hip_kernels/1/1/main.cu'
source_filename = "../data/hip_kernels/1/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21euclidean_kernel_samePKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21euclidean_kernel_samePKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readnone %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp eq i32 %11, %13
  %16 = icmp ult i64 %12, %2
  %17 = select i1 %15, i1 %16, i1 false
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %17, i1 %19, i1 false
  br i1 %20, label %21, label %25

21:                                               ; preds = %10
  %22 = mul i64 %14, %8
  %23 = add i64 %22, %12
  %24 = getelementptr inbounds float, float addrspace(1)* %7, i64 %23
  store float 0.000000e+00, float addrspace(1)* %24, align 4, !tbaa !4
  br label %25

25:                                               ; preds = %21, %10
  %26 = icmp ult i64 %14, %2
  %27 = icmp ult i32 %11, %13
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %103

29:                                               ; preds = %25
  %30 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ21euclidean_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %30, align 4, !tbaa !4
  %31 = zext i32 %18 to i64
  %32 = icmp ult i64 %31, %6
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = mul i64 %12, %1
  %35 = mul i64 %14, %1
  br label %46

36:                                               ; preds = %46
  store float %57, float addrspace(3)* %30, align 4, !tbaa !4
  br label %37

37:                                               ; preds = %36, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %39 = getelementptr i8, i8 addrspace(4)* %38, i64 4
  %40 = bitcast i8 addrspace(4)* %39 to i16 addrspace(4)*
  %41 = load i16, i16 addrspace(4)* %40, align 4, !range !8, !invariant.load !9
  %42 = icmp ult i16 %41, 2
  br i1 %42, label %60, label %43

43:                                               ; preds = %37
  %44 = lshr i16 %41, 1
  %45 = zext i16 %44 to i64
  br label %61

46:                                               ; preds = %33, %46
  %47 = phi float [ 0.000000e+00, %33 ], [ %57, %46 ]
  %48 = phi i64 [ %31, %33 ], [ %58, %46 ]
  %49 = add i64 %48, %34
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !4
  %52 = add i64 %48, %35
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4
  %55 = fsub contract float %51, %54
  %56 = fmul contract float %55, %55
  %57 = fadd contract float %47, %56
  %58 = add i64 %48, 32
  %59 = icmp ult i64 %58, %6
  br i1 %59, label %46, label %36, !llvm.loop !10

60:                                               ; preds = %71, %37
  br i1 %19, label %74, label %103

61:                                               ; preds = %43, %71
  %62 = phi i64 [ %72, %71 ], [ %45, %43 ]
  %63 = icmp ugt i64 %62, %31
  br i1 %63, label %64, label %71

64:                                               ; preds = %61
  %65 = trunc i64 %62 to i32
  %66 = add nuw nsw i32 %18, %65
  %67 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ21euclidean_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %66
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !4
  %69 = load float, float addrspace(3)* %30, align 4, !tbaa !4
  %70 = fadd contract float %68, %69
  store float %70, float addrspace(3)* %30, align 4, !tbaa !4
  br label %71

71:                                               ; preds = %64, %61
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = lshr i64 %62, 1
  %73 = icmp ult i64 %62, 2
  br i1 %73, label %60, label %61, !llvm.loop !12

74:                                               ; preds = %60
  %75 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ21euclidean_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !4
  %76 = fcmp olt float %75, 0x39F0000000000000
  %77 = select i1 %76, float 0x41F0000000000000, float 1.000000e+00
  %78 = fmul float %75, %77
  %79 = tail call float @llvm.sqrt.f32(float %78)
  %80 = bitcast float %79 to i32
  %81 = add nsw i32 %80, -1
  %82 = bitcast i32 %81 to float
  %83 = add nsw i32 %80, 1
  %84 = bitcast i32 %83 to float
  %85 = tail call i1 @llvm.amdgcn.class.f32(float %78, i32 608)
  %86 = select i1 %76, float 0x3EF0000000000000, float 1.000000e+00
  %87 = fneg float %84
  %88 = tail call float @llvm.fma.f32(float %87, float %79, float %78)
  %89 = fcmp ogt float %88, 0.000000e+00
  %90 = fneg float %82
  %91 = tail call float @llvm.fma.f32(float %90, float %79, float %78)
  %92 = fcmp ole float %91, 0.000000e+00
  %93 = select i1 %92, float %82, float %79
  %94 = select i1 %89, float %84, float %93
  %95 = fmul float %86, %94
  %96 = select i1 %85, float %78, float %95
  %97 = mul i64 %14, %8
  %98 = add i64 %97, %12
  %99 = getelementptr inbounds float, float addrspace(1)* %7, i64 %98
  store float %96, float addrspace(1)* %99, align 4, !tbaa !4
  %100 = mul i64 %12, %8
  %101 = add i64 %100, %14
  %102 = getelementptr inbounds float, float addrspace(1)* %7, i64 %101
  store float %96, float addrspace(1)* %102, align 4, !tbaa !4
  br label %103

103:                                              ; preds = %60, %74, %25
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
