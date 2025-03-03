; ModuleID = '../data/hip_kernels/1204/2/main.cu'
source_filename = "../data/hip_kernels/1204/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7kernelAiPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp slt i32 %15, %0
  br i1 %22, label %23, label %35

23:                                               ; preds = %3
  %24 = sdiv i32 %0, 128
  %25 = icmp sgt i32 %0, 127
  %26 = add nsw i32 %24, -1
  %27 = and i32 %24, 3
  %28 = icmp ult i32 %26, 3
  %29 = and i32 %24, -4
  %30 = icmp eq i32 %27, 0
  %31 = and i32 %24, 7
  %32 = icmp ult i32 %26, 7
  %33 = and i32 %24, -8
  %34 = icmp eq i32 %31, 0
  br label %36

35:                                               ; preds = %170, %3
  ret void

36:                                               ; preds = %23, %170
  %37 = phi i32 [ %15, %23 ], [ %171, %170 ]
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16
  %43 = fcmp contract ogt float %40, %42
  br i1 %43, label %46, label %44

44:                                               ; preds = %36
  br i1 %25, label %45, label %170

45:                                               ; preds = %44
  br i1 %28, label %156, label %109

46:                                               ; preds = %36
  br i1 %25, label %47, label %170

47:                                               ; preds = %46
  br i1 %32, label %142, label %48

48:                                               ; preds = %47, %48
  %49 = phi i32 [ %106, %48 ], [ 0, %47 ]
  %50 = phi i32 [ %107, %48 ], [ 0, %47 ]
  %51 = zext i32 %49 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fadd contract float %53, %55
  store float %56, float addrspace(1)* %41, align 4, !tbaa !16
  %57 = or i32 %49, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = fadd contract float %60, %62
  store float %63, float addrspace(1)* %41, align 4, !tbaa !16
  %64 = or i32 %49, 2
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fadd contract float %67, %69
  store float %70, float addrspace(1)* %41, align 4, !tbaa !16
  %71 = or i32 %49, 3
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = fadd contract float %74, %76
  store float %77, float addrspace(1)* %41, align 4, !tbaa !16
  %78 = or i32 %49, 4
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = fadd contract float %81, %83
  store float %84, float addrspace(1)* %41, align 4, !tbaa !16
  %85 = or i32 %49, 5
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fadd contract float %88, %90
  store float %91, float addrspace(1)* %41, align 4, !tbaa !16
  %92 = or i32 %49, 6
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fadd contract float %95, %97
  store float %98, float addrspace(1)* %41, align 4, !tbaa !16
  %99 = or i32 %49, 7
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = fadd contract float %102, %104
  store float %105, float addrspace(1)* %41, align 4, !tbaa !16
  %106 = add nuw nsw i32 %49, 8
  %107 = add i32 %50, 8
  %108 = icmp eq i32 %107, %33
  br i1 %108, label %142, label %48, !llvm.loop !20

109:                                              ; preds = %45, %109
  %110 = phi i32 [ %139, %109 ], [ 0, %45 ]
  %111 = phi i32 [ %140, %109 ], [ 0, %45 ]
  %112 = zext i32 %110 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16
  %117 = fdiv contract float %114, %116
  store float %117, float addrspace(1)* %41, align 4, !tbaa !16
  %118 = or i32 %110, 1
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %124 = fdiv contract float %121, %123
  store float %124, float addrspace(1)* %41, align 4, !tbaa !16
  %125 = or i32 %110, 2
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %126
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = fdiv contract float %128, %130
  store float %131, float addrspace(1)* %41, align 4, !tbaa !16
  %132 = or i32 %110, 3
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !16
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16
  %138 = fdiv contract float %135, %137
  store float %138, float addrspace(1)* %41, align 4, !tbaa !16
  %139 = add nuw nsw i32 %110, 4
  %140 = add i32 %111, 4
  %141 = icmp eq i32 %140, %29
  br i1 %141, label %156, label %109, !llvm.loop !22

142:                                              ; preds = %48, %47
  %143 = phi i32 [ 0, %47 ], [ %106, %48 ]
  br i1 %34, label %170, label %144

144:                                              ; preds = %142, %144
  %145 = phi i32 [ %153, %144 ], [ %143, %142 ]
  %146 = phi i32 [ %154, %144 ], [ 0, %142 ]
  %147 = zext i32 %145 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !16
  %150 = getelementptr inbounds float, float addrspace(1)* %2, i64 %147
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !16
  %152 = fadd contract float %149, %151
  store float %152, float addrspace(1)* %41, align 4, !tbaa !16
  %153 = add nuw nsw i32 %145, 1
  %154 = add i32 %146, 1
  %155 = icmp eq i32 %154, %31
  br i1 %155, label %170, label %144, !llvm.loop !23

156:                                              ; preds = %109, %45
  %157 = phi i32 [ 0, %45 ], [ %139, %109 ]
  br i1 %30, label %170, label %158

158:                                              ; preds = %156, %158
  %159 = phi i32 [ %167, %158 ], [ %157, %156 ]
  %160 = phi i32 [ %168, %158 ], [ 0, %156 ]
  %161 = zext i32 %159 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !16
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !16
  %166 = fdiv contract float %163, %165
  store float %166, float addrspace(1)* %41, align 4, !tbaa !16
  %167 = add nuw nsw i32 %159, 1
  %168 = add i32 %160, 1
  %169 = icmp eq i32 %168, %27
  br i1 %169, label %170, label %158, !llvm.loop !25

170:                                              ; preds = %156, %158, %142, %144, %44, %46
  %171 = add nsw i32 %37, %21
  %172 = icmp slt i32 %171, %0
  br i1 %172, label %36, label %35, !llvm.loop !26
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
!26 = distinct !{!26, !21}
