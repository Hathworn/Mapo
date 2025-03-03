; ModuleID = '../data/hip_kernels/501/5/main.cu'
source_filename = "../data/hip_kernels/501/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21manhattan_kernel_samePKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21manhattan_kernel_samePKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readnone %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %89

29:                                               ; preds = %25
  %30 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ21manhattan_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %30, align 4, !tbaa !4
  %31 = zext i32 %18 to i64
  %32 = icmp ult i64 %31, %6
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %44

35:                                               ; preds = %29
  %36 = mul i64 %12, %1
  %37 = mul i64 %14, %1
  %38 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %39 = getelementptr i8, i8 addrspace(4)* %38, i64 4
  %40 = bitcast i8 addrspace(4)* %39 to i16 addrspace(4)*
  %41 = load i16, i16 addrspace(4)* %40, align 4, !range !8, !invariant.load !9
  %42 = zext i16 %41 to i64
  br label %53

43:                                               ; preds = %53
  store float %64, float addrspace(3)* %30, align 4, !tbaa !4
  br label %44

44:                                               ; preds = %33, %43
  %45 = phi i8 addrspace(4)* [ %34, %33 ], [ %38, %43 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = getelementptr i8, i8 addrspace(4)* %45, i64 4
  %47 = bitcast i8 addrspace(4)* %46 to i16 addrspace(4)*
  %48 = load i16, i16 addrspace(4)* %47, align 4, !range !8, !invariant.load !9
  %49 = icmp ult i16 %48, 2
  br i1 %49, label %67, label %50

50:                                               ; preds = %44
  %51 = lshr i16 %48, 1
  %52 = zext i16 %51 to i64
  br label %68

53:                                               ; preds = %35, %53
  %54 = phi float [ 0.000000e+00, %35 ], [ %64, %53 ]
  %55 = phi i64 [ %31, %35 ], [ %65, %53 ]
  %56 = add i64 %55, %36
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !4
  %59 = add i64 %55, %37
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !4
  %62 = fsub contract float %58, %61
  %63 = tail call float @llvm.fabs.f32(float %62)
  %64 = fadd contract float %54, %63
  %65 = add i64 %55, %42
  %66 = icmp ult i64 %65, %6
  br i1 %66, label %53, label %43, !llvm.loop !10

67:                                               ; preds = %78, %44
  br i1 %19, label %81, label %89

68:                                               ; preds = %50, %78
  %69 = phi i64 [ %79, %78 ], [ %52, %50 ]
  %70 = icmp ugt i64 %69, %31
  br i1 %70, label %71, label %78

71:                                               ; preds = %68
  %72 = trunc i64 %69 to i32
  %73 = add nuw nsw i32 %18, %72
  %74 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ21manhattan_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !4
  %76 = load float, float addrspace(3)* %30, align 4, !tbaa !4
  %77 = fadd contract float %75, %76
  store float %77, float addrspace(3)* %30, align 4, !tbaa !4
  br label %78

78:                                               ; preds = %71, %68
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = lshr i64 %69, 1
  %80 = icmp ult i64 %69, 2
  br i1 %80, label %67, label %68, !llvm.loop !12

81:                                               ; preds = %67
  %82 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ21manhattan_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !4
  %83 = mul i64 %14, %8
  %84 = add i64 %83, %12
  %85 = getelementptr inbounds float, float addrspace(1)* %7, i64 %84
  store float %82, float addrspace(1)* %85, align 4, !tbaa !4
  %86 = mul i64 %12, %8
  %87 = add i64 %86, %14
  %88 = getelementptr inbounds float, float addrspace(1)* %7, i64 %87
  store float %82, float addrspace(1)* %88, align 4, !tbaa !4
  br label %89

89:                                               ; preds = %67, %81, %25
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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
