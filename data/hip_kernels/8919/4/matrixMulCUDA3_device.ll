; ModuleID = '../data/hip_kernels/8919/4/main.cu'
source_filename = "../data/hip_kernels/8919/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14matrixMulCUDA3PfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %163

25:                                               ; preds = %4
  %26 = icmp sgt i32 %3, 0
  %27 = mul nsw i32 %13, %3
  br i1 %26, label %28, label %56

28:                                               ; preds = %25
  %29 = and i32 %3, 7
  %30 = icmp ult i32 %3, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = and i32 %3, -8
  br label %61

33:                                               ; preds = %61, %28
  %34 = phi float [ undef, %28 ], [ %159, %61 ]
  %35 = phi i32 [ 0, %28 ], [ %160, %61 ]
  %36 = phi float [ 0.000000e+00, %28 ], [ %159, %61 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %56, label %38

38:                                               ; preds = %33, %38
  %39 = phi i32 [ %53, %38 ], [ %35, %33 ]
  %40 = phi float [ %52, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %54, %38 ], [ 0, %33 ]
  %42 = add nsw i32 %39, %27
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = mul nsw i32 %39, %3
  %47 = add nsw i32 %46, %21
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract float %45, %50
  %52 = fadd contract float %40, %51
  %53 = add nuw nsw i32 %39, 1
  %54 = add i32 %41, 1
  %55 = icmp eq i32 %54, %29
  br i1 %55, label %56, label %38, !llvm.loop !11

56:                                               ; preds = %33, %38, %25
  %57 = phi float [ 0.000000e+00, %25 ], [ %34, %33 ], [ %52, %38 ]
  %58 = add nsw i32 %27, %21
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float %57, float addrspace(1)* %60, align 4, !tbaa !7
  br label %163

61:                                               ; preds = %61, %31
  %62 = phi i32 [ 0, %31 ], [ %160, %61 ]
  %63 = phi float [ 0.000000e+00, %31 ], [ %159, %61 ]
  %64 = phi i32 [ 0, %31 ], [ %161, %61 ]
  %65 = add nsw i32 %62, %27
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = mul nsw i32 %62, %3
  %70 = add nsw i32 %69, %21
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = fmul contract float %68, %73
  %75 = fadd contract float %63, %74
  %76 = or i32 %62, 1
  %77 = add nsw i32 %76, %27
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = mul nsw i32 %76, %3
  %82 = add nsw i32 %81, %21
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = fmul contract float %80, %85
  %87 = fadd contract float %75, %86
  %88 = or i32 %62, 2
  %89 = add nsw i32 %88, %27
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = mul nsw i32 %88, %3
  %94 = add nsw i32 %93, %21
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = fmul contract float %92, %97
  %99 = fadd contract float %87, %98
  %100 = or i32 %62, 3
  %101 = add nsw i32 %100, %27
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = mul nsw i32 %100, %3
  %106 = add nsw i32 %105, %21
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %99, %110
  %112 = or i32 %62, 4
  %113 = add nsw i32 %112, %27
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = mul nsw i32 %112, %3
  %118 = add nsw i32 %117, %21
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fmul contract float %116, %121
  %123 = fadd contract float %111, %122
  %124 = or i32 %62, 5
  %125 = add nsw i32 %124, %27
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %129 = mul nsw i32 %124, %3
  %130 = add nsw i32 %129, %21
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = fmul contract float %128, %133
  %135 = fadd contract float %123, %134
  %136 = or i32 %62, 6
  %137 = add nsw i32 %136, %27
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %2, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = mul nsw i32 %136, %3
  %142 = add nsw i32 %141, %21
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = fmul contract float %140, %145
  %147 = fadd contract float %135, %146
  %148 = or i32 %62, 7
  %149 = add nsw i32 %148, %27
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %2, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = mul nsw i32 %148, %3
  %154 = add nsw i32 %153, %21
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = fmul contract float %152, %157
  %159 = fadd contract float %147, %158
  %160 = add nuw nsw i32 %62, 8
  %161 = add i32 %64, 8
  %162 = icmp eq i32 %161, %32
  br i1 %162, label %33, label %61, !llvm.loop !13

163:                                              ; preds = %4, %56
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
