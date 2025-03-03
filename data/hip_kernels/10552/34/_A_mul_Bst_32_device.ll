; ModuleID = '../data/hip_kernels/10552/34/main.cu'
source_filename = "../data/hip_kernels/10552/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13_A_mul_Bst_32iiPfS_PiS0_S_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %9, %14
  %19 = add i32 %18, %8
  %20 = sext i32 %1 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %20
  %22 = bitcast i32 addrspace(1)* %21 to <2 x i32> addrspace(1)*
  %23 = load <2 x i32>, <2 x i32> addrspace(1)* %22, align 4, !tbaa !16
  %24 = extractelement <2 x i32> %23, i64 0
  %25 = extractelement <2 x i32> %23, i64 1
  %26 = sub nsw i32 %25, %24
  %27 = icmp slt i32 %19, %26
  br i1 %27, label %28, label %175

28:                                               ; preds = %7
  %29 = add nsw i32 %24, -1
  %30 = icmp sgt i32 %0, 0
  %31 = mul nsw i32 %1, %0
  %32 = udiv i32 %17, %14
  %33 = mul i32 %32, %14
  %34 = icmp ugt i32 %17, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %14
  %38 = and i32 %0, 7
  %39 = icmp ult i32 %0, 8
  %40 = and i32 %0, -8
  %41 = icmp eq i32 %38, 0
  br label %42

42:                                               ; preds = %28, %172
  %43 = phi i32 [ %19, %28 ], [ %173, %172 ]
  %44 = add i32 %29, %43
  %45 = sext i32 %44 to i64
  br i1 %30, label %46, label %172

46:                                               ; preds = %42
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %45
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !6
  %49 = add nsw i32 %48, -1
  %50 = mul nsw i32 %49, %0
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  br i1 %39, label %153, label %52

52:                                               ; preds = %46, %52
  %53 = phi i32 [ %150, %52 ], [ 0, %46 ]
  %54 = phi i32 [ %151, %52 ], [ 0, %46 ]
  %55 = add nsw i32 %53, %31
  %56 = add nsw i32 %53, %50
  %57 = sext i32 %55 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !20
  %60 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %61 = fmul contract float %59, %60
  %62 = sext i32 %56 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %6, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !20
  %65 = fadd contract float %64, %61
  store float %65, float addrspace(1)* %63, align 4, !tbaa !20
  %66 = or i32 %53, 1
  %67 = add nsw i32 %66, %31
  %68 = add nsw i32 %66, %50
  %69 = sext i32 %67 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !20
  %72 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %73 = fmul contract float %71, %72
  %74 = sext i32 %68 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !20
  %77 = fadd contract float %76, %73
  store float %77, float addrspace(1)* %75, align 4, !tbaa !20
  %78 = or i32 %53, 2
  %79 = add nsw i32 %78, %31
  %80 = add nsw i32 %78, %50
  %81 = sext i32 %79 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !20
  %84 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %85 = fmul contract float %83, %84
  %86 = sext i32 %80 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %6, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !20
  %89 = fadd contract float %88, %85
  store float %89, float addrspace(1)* %87, align 4, !tbaa !20
  %90 = or i32 %53, 3
  %91 = add nsw i32 %90, %31
  %92 = add nsw i32 %90, %50
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !20
  %96 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %97 = fmul contract float %95, %96
  %98 = sext i32 %92 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %6, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !20
  %101 = fadd contract float %100, %97
  store float %101, float addrspace(1)* %99, align 4, !tbaa !20
  %102 = or i32 %53, 4
  %103 = add nsw i32 %102, %31
  %104 = add nsw i32 %102, %50
  %105 = sext i32 %103 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !20
  %108 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %109 = fmul contract float %107, %108
  %110 = sext i32 %104 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %6, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !20
  %113 = fadd contract float %112, %109
  store float %113, float addrspace(1)* %111, align 4, !tbaa !20
  %114 = or i32 %53, 5
  %115 = add nsw i32 %114, %31
  %116 = add nsw i32 %114, %50
  %117 = sext i32 %115 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !20
  %120 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %121 = fmul contract float %119, %120
  %122 = sext i32 %116 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %6, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !20
  %125 = fadd contract float %124, %121
  store float %125, float addrspace(1)* %123, align 4, !tbaa !20
  %126 = or i32 %53, 6
  %127 = add nsw i32 %126, %31
  %128 = add nsw i32 %126, %50
  %129 = sext i32 %127 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !20
  %132 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %133 = fmul contract float %131, %132
  %134 = sext i32 %128 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %6, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !20
  %137 = fadd contract float %136, %133
  store float %137, float addrspace(1)* %135, align 4, !tbaa !20
  %138 = or i32 %53, 7
  %139 = add nsw i32 %138, %31
  %140 = add nsw i32 %138, %50
  %141 = sext i32 %139 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %2, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !20
  %144 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %145 = fmul contract float %143, %144
  %146 = sext i32 %140 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %6, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !20
  %149 = fadd contract float %148, %145
  store float %149, float addrspace(1)* %147, align 4, !tbaa !20
  %150 = add nuw nsw i32 %53, 8
  %151 = add i32 %54, 8
  %152 = icmp eq i32 %151, %40
  br i1 %152, label %153, label %52, !llvm.loop !22

153:                                              ; preds = %52, %46
  %154 = phi i32 [ 0, %46 ], [ %150, %52 ]
  br i1 %41, label %172, label %155

155:                                              ; preds = %153, %155
  %156 = phi i32 [ %169, %155 ], [ %154, %153 ]
  %157 = phi i32 [ %170, %155 ], [ 0, %153 ]
  %158 = add nsw i32 %156, %31
  %159 = add nsw i32 %156, %50
  %160 = sext i32 %158 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %2, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !20
  %163 = load float, float addrspace(1)* %51, align 4, !tbaa !20
  %164 = fmul contract float %162, %163
  %165 = sext i32 %159 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %6, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !20
  %168 = fadd contract float %167, %164
  store float %168, float addrspace(1)* %166, align 4, !tbaa !20
  %169 = add nuw nsw i32 %156, 1
  %170 = add i32 %157, 1
  %171 = icmp eq i32 %170, %38
  br i1 %171, label %172, label %155, !llvm.loop !24

172:                                              ; preds = %153, %155, %42
  %173 = add i32 %37, %43
  %174 = icmp slt i32 %173, %26
  br i1 %174, label %42, label %175, !llvm.loop !26

175:                                              ; preds = %172, %7
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !23}
