; ModuleID = '../data/hip_kernels/6718/5/main.cu'
source_filename = "../data/hip_kernels/6718/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9naive_sumPfiS_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = icmp ult i32 %13, %1
  br i1 %14, label %15, label %118

15:                                               ; preds = %3
  %16 = zext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  %20 = add i32 %13, %10
  %21 = icmp ult i32 %20, %1
  br i1 %21, label %22, label %27

22:                                               ; preds = %15
  %23 = zext i32 %20 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = fadd contract float %18, %25
  store float %26, float addrspace(3)* %19, align 4, !tbaa !7
  br label %27

27:                                               ; preds = %22, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ugt i16 %9, 65
  br i1 %28, label %31, label %29

29:                                               ; preds = %44, %27
  %30 = icmp ult i32 %4, 32
  br i1 %30, label %46, label %112

31:                                               ; preds = %27, %44
  %32 = phi i32 [ %33, %44 ], [ %10, %27 ]
  %33 = lshr i32 %32, 1
  %34 = icmp ult i32 %4, %33
  %35 = add i32 %33, %13
  %36 = icmp ult i32 %35, %1
  %37 = select i1 %34, i1 %36, i1 false
  br i1 %37, label %38, label %44

38:                                               ; preds = %31
  %39 = add nuw nsw i32 %33, %4
  %40 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %39
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %42 = load float, float addrspace(3)* %19, align 4, !tbaa !7
  %43 = fadd contract float %41, %42
  store float %43, float addrspace(3)* %19, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %38, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ugt i32 %32, 131
  br i1 %45, label %31, label %29, !llvm.loop !11

46:                                               ; preds = %29
  %47 = add nsw i32 %13, 32
  %48 = icmp slt i32 %47, %1
  br i1 %48, label %49, label %57

49:                                               ; preds = %46
  %50 = add nuw nsw i32 %4, 32
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %50
  %52 = addrspacecast float addrspace(3)* %51 to float*
  %53 = load volatile float, float* %52, align 4, !tbaa !7
  %54 = addrspacecast float addrspace(3)* %19 to float*
  %55 = load volatile float, float* %54, align 4, !tbaa !7
  %56 = fadd contract float %53, %55
  store volatile float %56, float* %54, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %49, %46
  %58 = add nsw i32 %13, 16
  %59 = icmp slt i32 %58, %1
  br i1 %59, label %60, label %68

60:                                               ; preds = %57
  %61 = add nuw nsw i32 %4, 16
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %61
  %63 = addrspacecast float addrspace(3)* %62 to float*
  %64 = load volatile float, float* %63, align 4, !tbaa !7
  %65 = addrspacecast float addrspace(3)* %19 to float*
  %66 = load volatile float, float* %65, align 4, !tbaa !7
  %67 = fadd contract float %64, %66
  store volatile float %67, float* %65, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %60, %57
  %69 = add nsw i32 %13, 8
  %70 = icmp slt i32 %69, %1
  br i1 %70, label %71, label %79

71:                                               ; preds = %68
  %72 = add nuw nsw i32 %4, 8
  %73 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %72
  %74 = addrspacecast float addrspace(3)* %73 to float*
  %75 = load volatile float, float* %74, align 4, !tbaa !7
  %76 = addrspacecast float addrspace(3)* %19 to float*
  %77 = load volatile float, float* %76, align 4, !tbaa !7
  %78 = fadd contract float %75, %77
  store volatile float %78, float* %76, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %71, %68
  %80 = add nsw i32 %13, 4
  %81 = icmp slt i32 %80, %1
  br i1 %81, label %82, label %90

82:                                               ; preds = %79
  %83 = add nuw nsw i32 %4, 4
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %83
  %85 = addrspacecast float addrspace(3)* %84 to float*
  %86 = load volatile float, float* %85, align 4, !tbaa !7
  %87 = addrspacecast float addrspace(3)* %19 to float*
  %88 = load volatile float, float* %87, align 4, !tbaa !7
  %89 = fadd contract float %86, %88
  store volatile float %89, float* %87, align 4, !tbaa !7
  br label %90

90:                                               ; preds = %82, %79
  %91 = add nsw i32 %13, 2
  %92 = icmp slt i32 %91, %1
  br i1 %92, label %93, label %101

93:                                               ; preds = %90
  %94 = add nuw nsw i32 %4, 2
  %95 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %94
  %96 = addrspacecast float addrspace(3)* %95 to float*
  %97 = load volatile float, float* %96, align 4, !tbaa !7
  %98 = addrspacecast float addrspace(3)* %19 to float*
  %99 = load volatile float, float* %98, align 4, !tbaa !7
  %100 = fadd contract float %97, %99
  store volatile float %100, float* %98, align 4, !tbaa !7
  br label %101

101:                                              ; preds = %93, %90
  %102 = add nsw i32 %13, 1
  %103 = icmp slt i32 %102, %1
  br i1 %103, label %104, label %112

104:                                              ; preds = %101
  %105 = add nuw nsw i32 %4, 1
  %106 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %105
  %107 = addrspacecast float addrspace(3)* %106 to float*
  %108 = load volatile float, float* %107, align 4, !tbaa !7
  %109 = addrspacecast float addrspace(3)* %19 to float*
  %110 = load volatile float, float* %109, align 4, !tbaa !7
  %111 = fadd contract float %108, %110
  store volatile float %111, float* %109, align 4, !tbaa !7
  br label %112

112:                                              ; preds = %104, %101, %29
  %113 = icmp eq i32 %4, 0
  br i1 %113, label %114, label %118

114:                                              ; preds = %112
  %115 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %116 = zext i32 %5 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  store float %115, float addrspace(1)* %117, align 4, !tbaa !7
  br label %118

118:                                              ; preds = %112, %114, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
