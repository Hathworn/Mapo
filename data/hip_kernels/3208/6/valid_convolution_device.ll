; ModuleID = '../data/hip_kernels/3208/6/main.cu'
source_filename = "../data/hip_kernels/3208/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17valid_convolutionPfiS_iiS_ii(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp slt i32 %17, %6
  %27 = icmp slt i32 %25, %7
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %166

29:                                               ; preds = %8
  %30 = mul nsw i32 %17, %7
  %31 = add nsw i32 %25, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  store float 0.000000e+00, float addrspace(1)* %33, align 4, !tbaa !7
  %34 = icmp sgt i32 %1, 0
  br i1 %34, label %35, label %166

35:                                               ; preds = %29
  %36 = and i32 %1, 7
  %37 = icmp ult i32 %1, 8
  %38 = and i32 %1, -8
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %35, %68
  %41 = phi float [ %69, %68 ], [ 0.000000e+00, %35 ]
  %42 = phi i32 [ %70, %68 ], [ 0, %35 ]
  %43 = mul nsw i32 %42, %1
  %44 = add nsw i32 %42, %17
  %45 = mul nsw i32 %44, %3
  %46 = add i32 %45, %25
  br i1 %37, label %47, label %72

47:                                               ; preds = %72, %40
  %48 = phi float [ undef, %40 ], [ %162, %72 ]
  %49 = phi float [ %41, %40 ], [ %162, %72 ]
  %50 = phi i32 [ 0, %40 ], [ %163, %72 ]
  br i1 %39, label %68, label %51

51:                                               ; preds = %47, %51
  %52 = phi float [ %64, %51 ], [ %49, %47 ]
  %53 = phi i32 [ %65, %51 ], [ %50, %47 ]
  %54 = phi i32 [ %66, %51 ], [ 0, %47 ]
  %55 = add nsw i32 %53, %43
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = add i32 %46, %53
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fmul contract float %58, %62
  %64 = fadd contract float %52, %63
  store float %64, float addrspace(1)* %33, align 4, !tbaa !7
  %65 = add nuw nsw i32 %53, 1
  %66 = add i32 %54, 1
  %67 = icmp eq i32 %66, %36
  br i1 %67, label %68, label %51, !llvm.loop !11

68:                                               ; preds = %51, %47
  %69 = phi float [ %48, %47 ], [ %64, %51 ]
  %70 = add nuw nsw i32 %42, 1
  %71 = icmp eq i32 %70, %1
  br i1 %71, label %166, label %40, !llvm.loop !13

72:                                               ; preds = %40, %72
  %73 = phi float [ %162, %72 ], [ %41, %40 ]
  %74 = phi i32 [ %163, %72 ], [ 0, %40 ]
  %75 = phi i32 [ %164, %72 ], [ 0, %40 ]
  %76 = add nsw i32 %74, %43
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = add i32 %46, %74
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = fmul contract float %79, %83
  %85 = fadd contract float %73, %84
  store float %85, float addrspace(1)* %33, align 4, !tbaa !7
  %86 = or i32 %74, 1
  %87 = add nsw i32 %86, %43
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = add i32 %46, %86
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fmul contract float %90, %94
  %96 = fadd contract float %85, %95
  store float %96, float addrspace(1)* %33, align 4, !tbaa !7
  %97 = or i32 %74, 2
  %98 = add nsw i32 %97, %43
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = add i32 %46, %97
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fmul contract float %101, %105
  %107 = fadd contract float %96, %106
  store float %107, float addrspace(1)* %33, align 4, !tbaa !7
  %108 = or i32 %74, 3
  %109 = add nsw i32 %108, %43
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = add i32 %46, %108
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fmul contract float %112, %116
  %118 = fadd contract float %107, %117
  store float %118, float addrspace(1)* %33, align 4, !tbaa !7
  %119 = or i32 %74, 4
  %120 = add nsw i32 %119, %43
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = add i32 %46, %119
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = fmul contract float %123, %127
  %129 = fadd contract float %118, %128
  store float %129, float addrspace(1)* %33, align 4, !tbaa !7
  %130 = or i32 %74, 5
  %131 = add nsw i32 %130, %43
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = add i32 %46, %130
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %2, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %139 = fmul contract float %134, %138
  %140 = fadd contract float %129, %139
  store float %140, float addrspace(1)* %33, align 4, !tbaa !7
  %141 = or i32 %74, 6
  %142 = add nsw i32 %141, %43
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = add i32 %46, %141
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = fmul contract float %145, %149
  %151 = fadd contract float %140, %150
  store float %151, float addrspace(1)* %33, align 4, !tbaa !7
  %152 = or i32 %74, 7
  %153 = add nsw i32 %152, %43
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = add i32 %46, %152
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %2, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7
  %161 = fmul contract float %156, %160
  %162 = fadd contract float %151, %161
  store float %162, float addrspace(1)* %33, align 4, !tbaa !7
  %163 = add nuw nsw i32 %74, 8
  %164 = add i32 %75, 8
  %165 = icmp eq i32 %164, %38
  br i1 %165, label %47, label %72, !llvm.loop !15

166:                                              ; preds = %68, %29, %8
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
