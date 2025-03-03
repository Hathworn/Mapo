; ModuleID = '../data/hip_kernels/6580/20/main.cu'
source_filename = "../data/hip_kernels/6580/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18linearLayerForwardPfS_S_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %5
  %27 = icmp slt i32 %25, %6
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %172

29:                                               ; preds = %8
  %30 = icmp sgt i32 %4, 0
  br i1 %30, label %31, label %60

31:                                               ; preds = %29
  %32 = mul nsw i32 %17, %4
  %33 = and i32 %4, 7
  %34 = icmp ult i32 %4, 8
  br i1 %34, label %37, label %35

35:                                               ; preds = %31
  %36 = and i32 %4, -8
  br label %70

37:                                               ; preds = %70, %31
  %38 = phi float [ undef, %31 ], [ %168, %70 ]
  %39 = phi i32 [ 0, %31 ], [ %169, %70 ]
  %40 = phi float [ 0.000000e+00, %31 ], [ %168, %70 ]
  %41 = icmp eq i32 %33, 0
  br i1 %41, label %60, label %42

42:                                               ; preds = %37, %42
  %43 = phi i32 [ %57, %42 ], [ %39, %37 ]
  %44 = phi float [ %56, %42 ], [ %40, %37 ]
  %45 = phi i32 [ %58, %42 ], [ 0, %37 ]
  %46 = add nsw i32 %43, %32
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = mul nsw i32 %43, %6
  %51 = add nsw i32 %50, %25
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fmul contract float %49, %54
  %56 = fadd contract float %44, %55
  %57 = add nuw nsw i32 %43, 1
  %58 = add i32 %45, 1
  %59 = icmp eq i32 %58, %33
  br i1 %59, label %60, label %42, !llvm.loop !11

60:                                               ; preds = %37, %42, %29
  %61 = phi float [ 0.000000e+00, %29 ], [ %38, %37 ], [ %56, %42 ]
  %62 = sext i32 %17 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fadd contract float %61, %64
  %66 = mul nsw i32 %17, %6
  %67 = add nsw i32 %66, %25
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  store float %65, float addrspace(1)* %69, align 4, !tbaa !7
  br label %172

70:                                               ; preds = %70, %35
  %71 = phi i32 [ 0, %35 ], [ %169, %70 ]
  %72 = phi float [ 0.000000e+00, %35 ], [ %168, %70 ]
  %73 = phi i32 [ 0, %35 ], [ %170, %70 ]
  %74 = add nsw i32 %71, %32
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = mul nsw i32 %71, %6
  %79 = add nsw i32 %78, %25
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fmul contract float %77, %82
  %84 = fadd contract float %72, %83
  %85 = or i32 %71, 1
  %86 = add nsw i32 %85, %32
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = mul nsw i32 %85, %6
  %91 = add nsw i32 %90, %25
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = fmul contract float %89, %94
  %96 = fadd contract float %84, %95
  %97 = or i32 %71, 2
  %98 = add nsw i32 %97, %32
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = mul nsw i32 %97, %6
  %103 = add nsw i32 %102, %25
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fmul contract float %101, %106
  %108 = fadd contract float %96, %107
  %109 = or i32 %71, 3
  %110 = add nsw i32 %109, %32
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = mul nsw i32 %109, %6
  %115 = add nsw i32 %114, %25
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = fmul contract float %113, %118
  %120 = fadd contract float %108, %119
  %121 = or i32 %71, 4
  %122 = add nsw i32 %121, %32
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = mul nsw i32 %121, %6
  %127 = add nsw i32 %126, %25
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fmul contract float %125, %130
  %132 = fadd contract float %120, %131
  %133 = or i32 %71, 5
  %134 = add nsw i32 %133, %32
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = mul nsw i32 %133, %6
  %139 = add nsw i32 %138, %25
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %1, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = fmul contract float %137, %142
  %144 = fadd contract float %132, %143
  %145 = or i32 %71, 6
  %146 = add nsw i32 %145, %32
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !5
  %150 = mul nsw i32 %145, %6
  %151 = add nsw i32 %150, %25
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %155 = fmul contract float %149, %154
  %156 = fadd contract float %144, %155
  %157 = or i32 %71, 7
  %158 = add nsw i32 %157, %32
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !5
  %162 = mul nsw i32 %157, %6
  %163 = add nsw i32 %162, %25
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = fmul contract float %161, %166
  %168 = fadd contract float %156, %167
  %169 = add nuw nsw i32 %71, 8
  %170 = add i32 %73, 8
  %171 = icmp eq i32 %170, %36
  br i1 %171, label %37, label %70, !llvm.loop !13

172:                                              ; preds = %60, %8
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
