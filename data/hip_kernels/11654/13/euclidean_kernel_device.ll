; ModuleID = '../data/hip_kernels/11654/13/main.cu'
source_filename = "../data/hip_kernels/11654/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16euclidean_kernelPKfmmS0_mmmPfmE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16euclidean_kernelPKfmmS0_mmmPfm(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = zext i32 %10 to i64
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = zext i32 %12 to i64
  %14 = icmp ult i64 %11, %2
  %15 = icmp ult i64 %13, %5
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %97

17:                                               ; preds = %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %19 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16euclidean_kernelPKfmmS0_mmmPfmE4temp, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %19, align 4, !tbaa !5
  %20 = zext i32 %18 to i64
  %21 = icmp ult i64 %20, %6
  br i1 %21, label %24, label %22

22:                                               ; preds = %17
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %33

24:                                               ; preds = %17
  %25 = mul i64 %11, %1
  %26 = mul i64 %13, %4
  %27 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %28 = getelementptr i8, i8 addrspace(4)* %27, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !9, !invariant.load !10
  %31 = zext i16 %30 to i64
  br label %42

32:                                               ; preds = %42
  store float %53, float addrspace(3)* %19, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %22, %32
  %34 = phi i8 addrspace(4)* [ %23, %22 ], [ %27, %32 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = getelementptr i8, i8 addrspace(4)* %34, i64 4
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !9, !invariant.load !10
  %38 = icmp ult i16 %37, 2
  br i1 %38, label %56, label %39

39:                                               ; preds = %33
  %40 = lshr i16 %37, 1
  %41 = zext i16 %40 to i64
  br label %58

42:                                               ; preds = %24, %42
  %43 = phi float [ 0.000000e+00, %24 ], [ %53, %42 ]
  %44 = phi i64 [ %20, %24 ], [ %54, %42 ]
  %45 = add i64 %44, %25
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !10
  %48 = add i64 %44, %26
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !10
  %51 = fsub contract float %47, %50
  %52 = fmul contract float %51, %51
  %53 = fadd contract float %43, %52
  %54 = add i64 %44, %31
  %55 = icmp ult i64 %54, %6
  br i1 %55, label %42, label %32, !llvm.loop !11

56:                                               ; preds = %68, %33
  %57 = icmp eq i32 %18, 0
  br i1 %57, label %71, label %97

58:                                               ; preds = %39, %68
  %59 = phi i64 [ %69, %68 ], [ %41, %39 ]
  %60 = icmp ugt i64 %59, %20
  br i1 %60, label %61, label %68

61:                                               ; preds = %58
  %62 = trunc i64 %59 to i32
  %63 = add nuw nsw i32 %18, %62
  %64 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16euclidean_kernelPKfmmS0_mmmPfmE4temp, i32 0, i32 %63
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %66 = load float, float addrspace(3)* %19, align 4, !tbaa !5
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(3)* %19, align 4, !tbaa !5
  br label %68

68:                                               ; preds = %61, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = lshr i64 %59, 1
  %70 = icmp ult i64 %59, 2
  br i1 %70, label %56, label %58, !llvm.loop !13

71:                                               ; preds = %56
  %72 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16euclidean_kernelPKfmmS0_mmmPfmE4temp, i32 0, i32 0), align 16, !tbaa !5
  %73 = fcmp olt float %72, 0x39F0000000000000
  %74 = select i1 %73, float 0x41F0000000000000, float 1.000000e+00
  %75 = fmul float %72, %74
  %76 = tail call float @llvm.sqrt.f32(float %75)
  %77 = bitcast float %76 to i32
  %78 = add nsw i32 %77, -1
  %79 = bitcast i32 %78 to float
  %80 = add nsw i32 %77, 1
  %81 = bitcast i32 %80 to float
  %82 = tail call i1 @llvm.amdgcn.class.f32(float %75, i32 608)
  %83 = select i1 %73, float 0x3EF0000000000000, float 1.000000e+00
  %84 = fneg float %81
  %85 = tail call float @llvm.fma.f32(float %84, float %76, float %75)
  %86 = fcmp ogt float %85, 0.000000e+00
  %87 = fneg float %79
  %88 = tail call float @llvm.fma.f32(float %87, float %76, float %75)
  %89 = fcmp ole float %88, 0.000000e+00
  %90 = select i1 %89, float %79, float %76
  %91 = select i1 %86, float %81, float %90
  %92 = fmul float %83, %91
  %93 = select i1 %82, float %75, float %92
  %94 = mul i64 %13, %8
  %95 = add i64 %94, %11
  %96 = getelementptr inbounds float, float addrspace(1)* %7, i64 %95
  store float %93, float addrspace(1)* %96, align 4, !tbaa !5
  br label %97

97:                                               ; preds = %56, %71, %9
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
