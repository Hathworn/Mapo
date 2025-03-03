; ModuleID = '../data/hip_kernels/11654/3/main.cu'
source_filename = "../data/hip_kernels/11654/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15canberra_kernelPKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15canberra_kernelPKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %12, %2
  %16 = icmp ult i64 %14, %5
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %82

18:                                               ; preds = %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ15canberra_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %19
  store float 0.000000e+00, float addrspace(3)* %20, align 4, !tbaa !5
  %21 = zext i32 %19 to i64
  %22 = icmp ult i64 %21, %6
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %33

25:                                               ; preds = %18
  %26 = mul i64 %12, %1
  %27 = mul i64 %14, %4
  %28 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !9, !invariant.load !10
  %32 = zext i16 %31 to i64
  br label %42

33:                                               ; preds = %58, %23
  %34 = phi i8 addrspace(4)* [ %24, %23 ], [ %28, %58 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = getelementptr i8, i8 addrspace(4)* %34, i64 4
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !9, !invariant.load !10
  %38 = icmp ult i16 %37, 2
  br i1 %38, label %62, label %39

39:                                               ; preds = %33
  %40 = lshr i16 %37, 1
  %41 = zext i16 %40 to i64
  br label %64

42:                                               ; preds = %25, %58
  %43 = phi float [ 0.000000e+00, %25 ], [ %59, %58 ]
  %44 = phi i64 [ %21, %25 ], [ %60, %58 ]
  %45 = add i64 %44, %26
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !10
  %48 = add i64 %44, %27
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !10
  %51 = fadd contract float %47, %50
  %52 = fcmp contract une float %51, 0.000000e+00
  br i1 %52, label %53, label %58

53:                                               ; preds = %42
  %54 = fsub contract float %47, %50
  %55 = fdiv contract float %54, %51
  %56 = tail call contract float @llvm.fabs.f32(float %55)
  %57 = fadd contract float %56, %43
  store float %57, float addrspace(3)* %20, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %53, %42
  %59 = phi float [ %57, %53 ], [ %43, %42 ]
  %60 = add i64 %44, %32
  %61 = icmp ult i64 %60, %6
  br i1 %61, label %42, label %33, !llvm.loop !11

62:                                               ; preds = %74, %33
  %63 = icmp eq i32 %19, 0
  br i1 %63, label %77, label %82

64:                                               ; preds = %39, %74
  %65 = phi i64 [ %75, %74 ], [ %41, %39 ]
  %66 = icmp ugt i64 %65, %21
  br i1 %66, label %67, label %74

67:                                               ; preds = %64
  %68 = trunc i64 %65 to i32
  %69 = add nuw nsw i32 %19, %68
  %70 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ15canberra_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %72 = load float, float addrspace(3)* %20, align 4, !tbaa !5
  %73 = fadd contract float %71, %72
  store float %73, float addrspace(3)* %20, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %67, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = lshr i64 %65, 1
  %76 = icmp ult i64 %65, 2
  br i1 %76, label %62, label %64, !llvm.loop !13

77:                                               ; preds = %62
  %78 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ15canberra_kernelPKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !5
  %79 = mul i64 %14, %8
  %80 = add i64 %79, %12
  %81 = getelementptr inbounds float, float addrspace(1)* %7, i64 %80
  store float %78, float addrspace(1)* %81, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %62, %77, %10
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
