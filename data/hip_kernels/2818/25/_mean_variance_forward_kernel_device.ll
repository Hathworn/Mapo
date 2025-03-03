; ModuleID = '../data/hip_kernels/2818/25/main.cu'
source_filename = "../data/hip_kernels/2818/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29_mean_variance_forward_kernelPfiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = mul nsw i32 %3, %1
  %8 = sitofp i32 %7 to float
  %9 = fdiv contract float 1.000000e+00, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %10
  %27 = mul i32 %26, %19
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %29, %2
  br i1 %30, label %31, label %172

31:                                               ; preds = %6
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %4, i64 %32
  store float 0.000000e+00, float addrspace(1)* %33, align 4, !tbaa !16
  %34 = icmp sgt i32 %1, 0
  br i1 %34, label %35, label %164

35:                                               ; preds = %31
  %36 = icmp sgt i32 %3, 0
  %37 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  %38 = and i32 %3, 7
  %39 = icmp ult i32 %3, 8
  %40 = and i32 %3, -8
  %41 = icmp eq i32 %38, 0
  br label %42

42:                                               ; preds = %35, %159
  %43 = phi i32 [ 0, %35 ], [ %160, %159 ]
  br i1 %36, label %44, label %159

44:                                               ; preds = %42
  %45 = mul nsw i32 %43, %2
  %46 = add i32 %45, %29
  %47 = mul i32 %46, %3
  br i1 %39, label %141, label %48

48:                                               ; preds = %44, %48
  %49 = phi i32 [ %138, %48 ], [ 0, %44 ]
  %50 = phi i32 [ %139, %48 ], [ 0, %44 ]
  %51 = add nsw i32 %49, %47
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %56 = fadd contract float %54, %55
  store float %56, float addrspace(1)* %33, align 4, !tbaa !16
  %57 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %58 = fmul contract float %57, %57
  %59 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %60 = fadd contract float %59, %58
  store float %60, float addrspace(1)* %37, align 4, !tbaa !16
  %61 = or i32 %49, 1
  %62 = add nsw i32 %61, %47
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(1)* %33, align 4, !tbaa !16
  %68 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %69 = fmul contract float %68, %68
  %70 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %71 = fadd contract float %70, %69
  store float %71, float addrspace(1)* %37, align 4, !tbaa !16
  %72 = or i32 %49, 2
  %73 = add nsw i32 %72, %47
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %78 = fadd contract float %76, %77
  store float %78, float addrspace(1)* %33, align 4, !tbaa !16
  %79 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %80 = fmul contract float %79, %79
  %81 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %82 = fadd contract float %81, %80
  store float %82, float addrspace(1)* %37, align 4, !tbaa !16
  %83 = or i32 %49, 3
  %84 = add nsw i32 %83, %47
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %89 = fadd contract float %87, %88
  store float %89, float addrspace(1)* %33, align 4, !tbaa !16
  %90 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %91 = fmul contract float %90, %90
  %92 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %93 = fadd contract float %92, %91
  store float %93, float addrspace(1)* %37, align 4, !tbaa !16
  %94 = or i32 %49, 4
  %95 = add nsw i32 %94, %47
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %100 = fadd contract float %98, %99
  store float %100, float addrspace(1)* %33, align 4, !tbaa !16
  %101 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %102 = fmul contract float %101, %101
  %103 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %104 = fadd contract float %103, %102
  store float %104, float addrspace(1)* %37, align 4, !tbaa !16
  %105 = or i32 %49, 5
  %106 = add nsw i32 %105, %47
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %110 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %111 = fadd contract float %109, %110
  store float %111, float addrspace(1)* %33, align 4, !tbaa !16
  %112 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %113 = fmul contract float %112, %112
  %114 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %115 = fadd contract float %114, %113
  store float %115, float addrspace(1)* %37, align 4, !tbaa !16
  %116 = or i32 %49, 6
  %117 = add nsw i32 %116, %47
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %122 = fadd contract float %120, %121
  store float %122, float addrspace(1)* %33, align 4, !tbaa !16
  %123 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %124 = fmul contract float %123, %123
  %125 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %126 = fadd contract float %125, %124
  store float %126, float addrspace(1)* %37, align 4, !tbaa !16
  %127 = or i32 %49, 7
  %128 = add nsw i32 %127, %47
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %132 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %133 = fadd contract float %131, %132
  store float %133, float addrspace(1)* %33, align 4, !tbaa !16
  %134 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %135 = fmul contract float %134, %134
  %136 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %137 = fadd contract float %136, %135
  store float %137, float addrspace(1)* %37, align 4, !tbaa !16
  %138 = add nuw nsw i32 %49, 8
  %139 = add i32 %50, 8
  %140 = icmp eq i32 %139, %40
  br i1 %140, label %141, label %48, !llvm.loop !20

141:                                              ; preds = %48, %44
  %142 = phi i32 [ 0, %44 ], [ %138, %48 ]
  br i1 %41, label %159, label %143

143:                                              ; preds = %141, %143
  %144 = phi i32 [ %156, %143 ], [ %142, %141 ]
  %145 = phi i32 [ %157, %143 ], [ 0, %141 ]
  %146 = add nsw i32 %144, %47
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !16
  %150 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %151 = fadd contract float %149, %150
  store float %151, float addrspace(1)* %33, align 4, !tbaa !16
  %152 = load float, float addrspace(1)* %148, align 4, !tbaa !16
  %153 = fmul contract float %152, %152
  %154 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %155 = fadd contract float %154, %153
  store float %155, float addrspace(1)* %37, align 4, !tbaa !16
  %156 = add nuw nsw i32 %144, 1
  %157 = add i32 %145, 1
  %158 = icmp eq i32 %157, %38
  br i1 %158, label %159, label %143, !llvm.loop !22

159:                                              ; preds = %141, %143, %42
  %160 = add nuw nsw i32 %43, 1
  %161 = icmp eq i32 %160, %1
  br i1 %161, label %162, label %42, !llvm.loop !24

162:                                              ; preds = %159
  %163 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  br label %164

164:                                              ; preds = %162, %31
  %165 = phi float [ %163, %162 ], [ 0.000000e+00, %31 ]
  %166 = fmul contract float %9, %165
  store float %166, float addrspace(1)* %33, align 4, !tbaa !16
  %167 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !16
  %169 = fmul contract float %9, %168
  %170 = fmul contract float %166, %166
  %171 = fsub contract float %169, %170
  store float %171, float addrspace(1)* %167, align 4, !tbaa !16
  br label %172

172:                                              ; preds = %6, %164
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
