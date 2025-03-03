; ModuleID = '../data/hip_kernels/1/9/main.cu'
source_filename = "../data/hip_kernels/1/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18binary_kernel_samePKfmmS0_mmmPfmfE4temp = internal unnamed_addr addrspace(3) global [64 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18binary_kernel_samePKfmmS0_mmmPfmf(float addrspace(1)* nocapture readonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readnone %3, i64 %4, i64 %5, i64 %6, float addrspace(1)* nocapture writeonly %7, i64 %8, float %9) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %109

29:                                               ; preds = %25
  %30 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ18binary_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %18
  store float 0.000000e+00, float addrspace(3)* %30, align 4, !tbaa !4
  %31 = add nuw nsw i32 %18, 32
  %32 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ18binary_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %31
  store float 0.000000e+00, float addrspace(3)* %32, align 4, !tbaa !4
  %33 = zext i32 %18 to i64
  %34 = icmp ult i64 %33, %6
  br i1 %34, label %37, label %35

35:                                               ; preds = %29
  %36 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %45

37:                                               ; preds = %29
  %38 = mul i64 %12, %1
  %39 = mul i64 %14, %1
  %40 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %41 = getelementptr i8, i8 addrspace(4)* %40, i64 4
  %42 = bitcast i8 addrspace(4)* %41 to i16 addrspace(4)*
  %43 = load i16, i16 addrspace(4)* %42, align 4, !range !8, !invariant.load !9
  %44 = zext i16 %43 to i64
  br label %54

45:                                               ; preds = %74, %35
  %46 = phi i8 addrspace(4)* [ %36, %35 ], [ %40, %74 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = getelementptr i8, i8 addrspace(4)* %46, i64 4
  %48 = bitcast i8 addrspace(4)* %47 to i16 addrspace(4)*
  %49 = load i16, i16 addrspace(4)* %48, align 4, !range !8, !invariant.load !9
  %50 = icmp ult i16 %49, 2
  br i1 %50, label %78, label %51

51:                                               ; preds = %45
  %52 = lshr i16 %49, 1
  %53 = zext i16 %52 to i64
  br label %79

54:                                               ; preds = %37, %74
  %55 = phi float [ 0.000000e+00, %37 ], [ %75, %74 ]
  %56 = phi float [ 0.000000e+00, %37 ], [ %70, %74 ]
  %57 = phi i64 [ %33, %37 ], [ %76, %74 ]
  %58 = add i64 %57, %38
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !4
  %61 = fcmp contract une float %60, 0.000000e+00
  %62 = add i64 %57, %39
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4
  %65 = fcmp contract une float %64, 0.000000e+00
  %66 = xor i1 %61, %65
  br i1 %66, label %67, label %69

67:                                               ; preds = %54
  %68 = fadd contract float %56, 1.000000e+00
  store float %68, float addrspace(3)* %30, align 4, !tbaa !4
  br label %69

69:                                               ; preds = %67, %54
  %70 = phi float [ %68, %67 ], [ %56, %54 ]
  %71 = select i1 %61, i1 true, i1 %65
  br i1 %71, label %72, label %74

72:                                               ; preds = %69
  %73 = fadd contract float %55, 1.000000e+00
  store float %73, float addrspace(3)* %32, align 4, !tbaa !4
  br label %74

74:                                               ; preds = %69, %72
  %75 = phi float [ %55, %69 ], [ %73, %72 ]
  %76 = add i64 %57, %44
  %77 = icmp ult i64 %76, %6
  br i1 %77, label %54, label %45, !llvm.loop !10

78:                                               ; preds = %94, %45
  br i1 %19, label %97, label %109

79:                                               ; preds = %51, %94
  %80 = phi i64 [ %95, %94 ], [ %53, %51 ]
  %81 = icmp ugt i64 %80, %33
  br i1 %81, label %82, label %94

82:                                               ; preds = %79
  %83 = trunc i64 %80 to i32
  %84 = add nuw nsw i32 %18, %83
  %85 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ18binary_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !4
  %87 = load float, float addrspace(3)* %30, align 4, !tbaa !4
  %88 = fadd contract float %86, %87
  store float %88, float addrspace(3)* %30, align 4, !tbaa !4
  %89 = add nuw nsw i32 %84, 32
  %90 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ18binary_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 %89
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !4
  %92 = load float, float addrspace(3)* %32, align 4, !tbaa !4
  %93 = fadd contract float %91, %92
  store float %93, float addrspace(3)* %32, align 4, !tbaa !4
  br label %94

94:                                               ; preds = %82, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = lshr i64 %80, 1
  %96 = icmp ult i64 %80, 2
  br i1 %96, label %78, label %79, !llvm.loop !12

97:                                               ; preds = %78
  %98 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ18binary_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 0), align 16, !tbaa !4
  %99 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ18binary_kernel_samePKfmmS0_mmmPfmfE4temp, i32 0, i32 32), align 16, !tbaa !4
  %100 = fcmp contract une float %99, 0.000000e+00
  %101 = select i1 %100, float %99, float 1.000000e+00
  %102 = fdiv contract float %98, %101
  %103 = mul i64 %14, %8
  %104 = add i64 %103, %12
  %105 = getelementptr inbounds float, float addrspace(1)* %7, i64 %104
  store float %102, float addrspace(1)* %105, align 4, !tbaa !4
  %106 = mul i64 %12, %8
  %107 = add i64 %106, %14
  %108 = getelementptr inbounds float, float addrspace(1)* %7, i64 %107
  store float %102, float addrspace(1)* %108, align 4, !tbaa !4
  br label %109

109:                                              ; preds = %78, %97, %25
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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
