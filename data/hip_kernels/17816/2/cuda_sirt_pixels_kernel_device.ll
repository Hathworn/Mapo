; ModuleID = '../data/hip_kernels/17816/2/main.cu'
source_filename = "../data/hip_kernels/17816/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23cuda_sirt_pixels_kerneliiiPfPKf(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %11
  %24 = icmp slt i32 %17, %2
  br i1 %24, label %25, label %40

25:                                               ; preds = %5
  %26 = icmp sgt i32 %1, 0
  %27 = mul nsw i32 %2, %0
  %28 = and i32 %1, 7
  %29 = icmp ult i32 %1, 8
  %30 = and i32 %1, -8
  %31 = icmp eq i32 %28, 0
  %32 = and i32 %1, 7
  %33 = icmp ult i32 %1, 8
  %34 = and i32 %1, -8
  %35 = icmp eq i32 %32, 0
  br label %36

36:                                               ; preds = %25, %133
  %37 = phi i32 [ %17, %25 ], [ %134, %133 ]
  br i1 %26, label %38, label %57

38:                                               ; preds = %36
  %39 = mul nsw i32 %37, %1
  br i1 %29, label %41, label %66

40:                                               ; preds = %133, %5
  ret void

41:                                               ; preds = %66, %38
  %42 = phi float [ undef, %38 ], [ %116, %66 ]
  %43 = phi i32 [ 0, %38 ], [ %117, %66 ]
  %44 = phi float [ 0.000000e+00, %38 ], [ %116, %66 ]
  br i1 %31, label %57, label %45

45:                                               ; preds = %41, %45
  %46 = phi i32 [ %54, %45 ], [ %43, %41 ]
  %47 = phi float [ %53, %45 ], [ %44, %41 ]
  %48 = phi i32 [ %55, %45 ], [ 0, %41 ]
  %49 = add nsw i32 %46, %39
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %53 = fadd contract float %47, %52
  %54 = add nuw nsw i32 %46, 1
  %55 = add i32 %48, 1
  %56 = icmp eq i32 %55, %28
  br i1 %56, label %57, label %45, !llvm.loop !20

57:                                               ; preds = %41, %45, %36
  %58 = phi float [ 0.000000e+00, %36 ], [ %42, %41 ], [ %53, %45 ]
  %59 = add nsw i32 %37, %27
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %4, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = fsub contract float %62, %58
  br i1 %26, label %64, label %133

64:                                               ; preds = %57
  %65 = mul nsw i32 %37, %1
  br i1 %33, label %120, label %136

66:                                               ; preds = %38, %66
  %67 = phi i32 [ %117, %66 ], [ 0, %38 ]
  %68 = phi float [ %116, %66 ], [ 0.000000e+00, %38 ]
  %69 = phi i32 [ %118, %66 ], [ 0, %38 ]
  %70 = add nsw i32 %67, %39
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %3, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = fadd contract float %68, %73
  %75 = or i32 %67, 1
  %76 = add nsw i32 %75, %39
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fadd contract float %74, %79
  %81 = or i32 %67, 2
  %82 = add nsw i32 %81, %39
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %3, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fadd contract float %80, %85
  %87 = or i32 %67, 3
  %88 = add nsw i32 %87, %39
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %3, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = fadd contract float %86, %91
  %93 = or i32 %67, 4
  %94 = add nsw i32 %93, %39
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %3, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fadd contract float %92, %97
  %99 = or i32 %67, 5
  %100 = add nsw i32 %99, %39
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %3, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = fadd contract float %98, %103
  %105 = or i32 %67, 6
  %106 = add nsw i32 %105, %39
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %3, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %110 = fadd contract float %104, %109
  %111 = or i32 %67, 7
  %112 = add nsw i32 %111, %39
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %3, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16
  %116 = fadd contract float %110, %115
  %117 = add nuw nsw i32 %67, 8
  %118 = add i32 %69, 8
  %119 = icmp eq i32 %118, %30
  br i1 %119, label %41, label %66, !llvm.loop !22

120:                                              ; preds = %136, %64
  %121 = phi i32 [ 0, %64 ], [ %186, %136 ]
  br i1 %35, label %133, label %122

122:                                              ; preds = %120, %122
  %123 = phi i32 [ %130, %122 ], [ %121, %120 ]
  %124 = phi i32 [ %131, %122 ], [ 0, %120 ]
  %125 = add nsw i32 %123, %65
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %3, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16
  %129 = fadd contract float %63, %128
  store float %129, float addrspace(1)* %127, align 4, !tbaa !16
  %130 = add nuw nsw i32 %123, 1
  %131 = add i32 %124, 1
  %132 = icmp eq i32 %131, %32
  br i1 %132, label %133, label %122, !llvm.loop !24

133:                                              ; preds = %120, %122, %57
  %134 = add nsw i32 %37, %23
  %135 = icmp slt i32 %134, %2
  br i1 %135, label %36, label %40, !llvm.loop !25

136:                                              ; preds = %64, %136
  %137 = phi i32 [ %186, %136 ], [ 0, %64 ]
  %138 = phi i32 [ %187, %136 ], [ 0, %64 ]
  %139 = add nsw i32 %137, %65
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %3, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !16
  %143 = fadd contract float %63, %142
  store float %143, float addrspace(1)* %141, align 4, !tbaa !16
  %144 = or i32 %137, 1
  %145 = add nsw i32 %144, %65
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %3, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = fadd contract float %63, %148
  store float %149, float addrspace(1)* %147, align 4, !tbaa !16
  %150 = or i32 %137, 2
  %151 = add nsw i32 %150, %65
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %3, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !16
  %155 = fadd contract float %63, %154
  store float %155, float addrspace(1)* %153, align 4, !tbaa !16
  %156 = or i32 %137, 3
  %157 = add nsw i32 %156, %65
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %3, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !16
  %161 = fadd contract float %63, %160
  store float %161, float addrspace(1)* %159, align 4, !tbaa !16
  %162 = or i32 %137, 4
  %163 = add nsw i32 %162, %65
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %3, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !16
  %167 = fadd contract float %63, %166
  store float %167, float addrspace(1)* %165, align 4, !tbaa !16
  %168 = or i32 %137, 5
  %169 = add nsw i32 %168, %65
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %3, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !16
  %173 = fadd contract float %63, %172
  store float %173, float addrspace(1)* %171, align 4, !tbaa !16
  %174 = or i32 %137, 6
  %175 = add nsw i32 %174, %65
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %3, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !16
  %179 = fadd contract float %63, %178
  store float %179, float addrspace(1)* %177, align 4, !tbaa !16
  %180 = or i32 %137, 7
  %181 = add nsw i32 %180, %65
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %3, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !16
  %185 = fadd contract float %63, %184
  store float %185, float addrspace(1)* %183, align 4, !tbaa !16
  %186 = add nuw nsw i32 %137, 8
  %187 = add i32 %138, 8
  %188 = icmp eq i32 %187, %34
  br i1 %188, label %120, label %136, !llvm.loop !26
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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !23}
