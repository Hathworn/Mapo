; ModuleID = '../data/hip_kernels/14087/11/main.cu'
source_filename = "../data/hip_kernels/14087/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_mem = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24cuda_graph_avgpool_bpropPfPKfS1_iiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %5
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = mul i32 %9, %3
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = icmp sgt i32 %6, 0
  br i1 %16, label %17, label %45

17:                                               ; preds = %7
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = and i32 %6, 3
  %24 = icmp ult i32 %6, 4
  br i1 %24, label %27, label %25

25:                                               ; preds = %17
  %26 = and i32 %6, -4
  br label %55

27:                                               ; preds = %96, %17
  %28 = phi i32 [ 0, %17 ], [ %97, %96 ]
  %29 = icmp eq i32 %23, 0
  br i1 %29, label %45, label %30

30:                                               ; preds = %27, %41
  %31 = phi i32 [ %42, %41 ], [ %28, %27 ]
  %32 = phi i32 [ %43, %41 ], [ 0, %27 ]
  %33 = mul i32 %31, %22
  %34 = add i32 %33, %8
  %35 = icmp slt i32 %34, %3
  br i1 %35, label %36, label %41

36:                                               ; preds = %30
  %37 = sext i32 %34 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %15, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %34
  store float %39, float addrspace(3)* %40, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %36, %30
  %42 = add nuw nsw i32 %31, 1
  %43 = add i32 %32, 1
  %44 = icmp eq i32 %43, %23
  br i1 %44, label %45, label %30, !llvm.loop !11

45:                                               ; preds = %27, %41, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp slt i32 %8, %4
  %47 = icmp sgt i32 %3, 0
  %48 = select i1 %46, i1 %47, i1 false
  br i1 %48, label %49, label %156

49:                                               ; preds = %45
  %50 = sitofp i32 %4 to float
  %51 = and i32 %3, 1
  %52 = icmp eq i32 %3, 1
  br i1 %52, label %137, label %53

53:                                               ; preds = %49
  %54 = and i32 %3, -2
  br label %100

55:                                               ; preds = %96, %25
  %56 = phi i32 [ 0, %25 ], [ %97, %96 ]
  %57 = phi i32 [ 0, %25 ], [ %98, %96 ]
  %58 = mul i32 %56, %22
  %59 = add i32 %58, %8
  %60 = icmp slt i32 %59, %3
  br i1 %60, label %61, label %66

61:                                               ; preds = %55
  %62 = sext i32 %59 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %15, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %59
  store float %64, float addrspace(3)* %65, align 4, !tbaa !7
  br label %66

66:                                               ; preds = %61, %55
  %67 = or i32 %56, 1
  %68 = mul i32 %67, %22
  %69 = add i32 %68, %8
  %70 = icmp slt i32 %69, %3
  br i1 %70, label %71, label %76

71:                                               ; preds = %66
  %72 = sext i32 %69 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %15, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !6
  %75 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %69
  store float %74, float addrspace(3)* %75, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %71, %66
  %77 = or i32 %56, 2
  %78 = mul i32 %77, %22
  %79 = add i32 %78, %8
  %80 = icmp slt i32 %79, %3
  br i1 %80, label %81, label %86

81:                                               ; preds = %76
  %82 = sext i32 %79 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %15, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %79
  store float %84, float addrspace(3)* %85, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %81, %76
  %87 = or i32 %56, 3
  %88 = mul i32 %87, %22
  %89 = add i32 %88, %8
  %90 = icmp slt i32 %89, %3
  br i1 %90, label %91, label %96

91:                                               ; preds = %86
  %92 = sext i32 %89 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %15, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !6
  %95 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %89
  store float %94, float addrspace(3)* %95, align 4, !tbaa !7
  br label %96

96:                                               ; preds = %91, %86
  %97 = add nuw nsw i32 %56, 4
  %98 = add i32 %57, 4
  %99 = icmp eq i32 %98, %26
  br i1 %99, label %27, label %55, !llvm.loop !13

100:                                              ; preds = %100, %53
  %101 = phi i32 [ 0, %53 ], [ %134, %100 ]
  %102 = phi i32 [ 0, %53 ], [ %135, %100 ]
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %15, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fdiv contract float %105, %50
  %107 = mul nsw i32 %101, %4
  %108 = add nsw i32 %107, %8
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fadd contract float %111, -1.000000e+00
  %113 = fptosi float %112 to i32
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %12, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fadd contract float %106, %116
  store float %117, float addrspace(1)* %115, align 4, !tbaa !7
  %118 = or i32 %101, 1
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %15, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fdiv contract float %121, %50
  %123 = mul nsw i32 %118, %4
  %124 = add nsw i32 %123, %8
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = fadd contract float %127, -1.000000e+00
  %129 = fptosi float %128 to i32
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %12, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fadd contract float %122, %132
  store float %133, float addrspace(1)* %131, align 4, !tbaa !7
  %134 = add nuw nsw i32 %101, 2
  %135 = add i32 %102, 2
  %136 = icmp eq i32 %135, %54
  br i1 %136, label %137, label %100, !llvm.loop !15

137:                                              ; preds = %100, %49
  %138 = phi i32 [ 0, %49 ], [ %134, %100 ]
  %139 = icmp eq i32 %51, 0
  br i1 %139, label %156, label %140

140:                                              ; preds = %137
  %141 = zext i32 %138 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %15, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = fdiv contract float %143, %50
  %145 = mul nsw i32 %138, %4
  %146 = add nsw i32 %145, %8
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = fadd contract float %149, -1.000000e+00
  %151 = fptosi float %150 to i32
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %12, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7
  %155 = fadd contract float %144, %154
  store float %155, float addrspace(1)* %153, align 4, !tbaa !7
  br label %156

156:                                              ; preds = %140, %137, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
