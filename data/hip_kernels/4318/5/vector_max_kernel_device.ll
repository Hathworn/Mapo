; ModuleID = '../data/hip_kernels/4318/5/main.cu'
source_filename = "../data/hip_kernels/4318/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17vector_max_kernelPKfiiPfE5value = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17vector_max_kernelPKfiiPf(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul i32 %5, %2
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = add nsw i32 %6, %2
  %10 = tail call i32 @llvm.smin.i32(i32 %1, i32 %9)
  %11 = icmp slt i32 %8, %10
  br i1 %11, label %12, label %18

12:                                               ; preds = %4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  br label %22

18:                                               ; preds = %22, %4
  %19 = phi float [ 0.000000e+00, %4 ], [ %29, %22 ]
  %20 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %7
  store float %19, float addrspace(3)* %20, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp ult i32 %7, 128
  br i1 %21, label %32, label %38

22:                                               ; preds = %12, %22
  %23 = phi i32 [ %8, %12 ], [ %30, %22 ]
  %24 = phi float [ 0.000000e+00, %12 ], [ %29, %22 ]
  %25 = sext i32 %23 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = tail call float @llvm.fabs.f32(float %27)
  %29 = tail call float @llvm.maxnum.f32(float %24, float %28)
  %30 = add i32 %23, %17
  %31 = icmp slt i32 %30, %10
  br i1 %31, label %22, label %18, !llvm.loop !11

32:                                               ; preds = %18
  %33 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %34 = add nuw nsw i32 %7, 128
  %35 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %34
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %37 = tail call float @llvm.maxnum.f32(float %33, float %36)
  store float %37, float addrspace(3)* %20, align 4, !tbaa !7
  br label %38

38:                                               ; preds = %32, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i32 %7, 64
  br i1 %39, label %40, label %46

40:                                               ; preds = %38
  %41 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %42 = add nuw nsw i32 %7, 64
  %43 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %45 = tail call float @llvm.maxnum.f32(float %41, float %44)
  store float %45, float addrspace(3)* %20, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %40, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = icmp ult i32 %7, 32
  br i1 %47, label %48, label %54

48:                                               ; preds = %46
  %49 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %50 = add nuw nsw i32 %7, 32
  %51 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %53 = tail call float @llvm.maxnum.f32(float %49, float %52)
  store float %53, float addrspace(3)* %20, align 4, !tbaa !7
  br label %54

54:                                               ; preds = %48, %46
  %55 = icmp ult i32 %7, 16
  br i1 %55, label %56, label %62

56:                                               ; preds = %54
  %57 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %58 = add nuw nsw i32 %7, 16
  %59 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %58
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %61 = tail call float @llvm.maxnum.f32(float %57, float %60)
  store float %61, float addrspace(3)* %20, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %56, %54
  %63 = icmp ult i32 %7, 8
  br i1 %63, label %64, label %70

64:                                               ; preds = %62
  %65 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %66 = add nuw nsw i32 %7, 8
  %67 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %66
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %69 = tail call float @llvm.maxnum.f32(float %65, float %68)
  store float %69, float addrspace(3)* %20, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %64, %62
  %71 = icmp ult i32 %7, 4
  br i1 %71, label %72, label %78

72:                                               ; preds = %70
  %73 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %74 = add nuw nsw i32 %7, 4
  %75 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %77 = tail call float @llvm.maxnum.f32(float %73, float %76)
  store float %77, float addrspace(3)* %20, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %72, %70
  %79 = icmp ult i32 %7, 2
  br i1 %79, label %80, label %86

80:                                               ; preds = %78
  %81 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %82 = add nuw nsw i32 %7, 2
  %83 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %85 = tail call float @llvm.maxnum.f32(float %81, float %84)
  store float %85, float addrspace(3)* %20, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %80, %78
  %87 = icmp eq i32 %7, 0
  br i1 %87, label %88, label %94

88:                                               ; preds = %86
  %89 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 0), align 16, !tbaa !7
  %90 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ17vector_max_kernelPKfiiPfE5value, i32 0, i32 1), align 4, !tbaa !7
  %91 = tail call float @llvm.maxnum.f32(float %89, float %90)
  %92 = zext i32 %5 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  store float %91, float addrspace(1)* %93, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %88, %86
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
