; ModuleID = '../data/hip_kernels/8504/4/main.cu'
source_filename = "../data/hip_kernels/8504/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4kDotiPKfS0_Pfiii(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %33

21:                                               ; preds = %7
  %22 = icmp sgt i32 %5, 0
  %23 = udiv i32 %16, %13
  %24 = mul i32 %23, %13
  %25 = icmp ugt i32 %16, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %13
  %29 = and i32 %5, 7
  %30 = icmp ult i32 %5, 8
  %31 = and i32 %5, -8
  %32 = icmp eq i32 %29, 0
  br label %34

33:                                               ; preds = %65, %7
  ret void

34:                                               ; preds = %21, %65
  %35 = phi i32 [ %19, %21 ], [ %69, %65 ]
  %36 = freeze i32 %35
  %37 = freeze i32 %6
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  br i1 %22, label %41, label %65

41:                                               ; preds = %34
  %42 = mul nsw i32 %38, %5
  br i1 %30, label %43, label %71

43:                                               ; preds = %71, %41
  %44 = phi float [ undef, %41 ], [ %169, %71 ]
  %45 = phi i32 [ 0, %41 ], [ %170, %71 ]
  %46 = phi float [ 0.000000e+00, %41 ], [ %169, %71 ]
  br i1 %32, label %65, label %47

47:                                               ; preds = %43, %47
  %48 = phi i32 [ %62, %47 ], [ %45, %43 ]
  %49 = phi float [ %61, %47 ], [ %46, %43 ]
  %50 = phi i32 [ %63, %47 ], [ 0, %43 ]
  %51 = add nsw i32 %48, %42
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = mul nsw i32 %48, %6
  %56 = add nsw i32 %55, %40
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fmul contract float %54, %59
  %61 = fadd contract float %49, %60
  %62 = add nuw nsw i32 %48, 1
  %63 = add i32 %50, 1
  %64 = icmp eq i32 %63, %29
  br i1 %64, label %65, label %47, !llvm.loop !20

65:                                               ; preds = %43, %47, %34
  %66 = phi float [ 0.000000e+00, %34 ], [ %44, %43 ], [ %61, %47 ]
  %67 = sext i32 %35 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  store float %66, float addrspace(1)* %68, align 4, !tbaa !16
  %69 = add i32 %28, %35
  %70 = icmp slt i32 %69, %0
  br i1 %70, label %34, label %33, !llvm.loop !22

71:                                               ; preds = %41, %71
  %72 = phi i32 [ %170, %71 ], [ 0, %41 ]
  %73 = phi float [ %169, %71 ], [ 0.000000e+00, %41 ]
  %74 = phi i32 [ %171, %71 ], [ 0, %41 ]
  %75 = add nsw i32 %72, %42
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = mul nsw i32 %72, %6
  %80 = add nsw i32 %79, %40
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = fmul contract float %78, %83
  %85 = fadd contract float %73, %84
  %86 = or i32 %72, 1
  %87 = add nsw i32 %86, %42
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = mul nsw i32 %86, %6
  %92 = add nsw i32 %91, %40
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = fmul contract float %90, %95
  %97 = fadd contract float %85, %96
  %98 = or i32 %72, 2
  %99 = add nsw i32 %98, %42
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = mul nsw i32 %98, %6
  %104 = add nsw i32 %103, %40
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fmul contract float %102, %107
  %109 = fadd contract float %97, %108
  %110 = or i32 %72, 3
  %111 = add nsw i32 %110, %42
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = mul nsw i32 %110, %6
  %116 = add nsw i32 %115, %40
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = fmul contract float %114, %119
  %121 = fadd contract float %109, %120
  %122 = or i32 %72, 4
  %123 = add nsw i32 %122, %42
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = mul nsw i32 %122, %6
  %128 = add nsw i32 %127, %40
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %121, %132
  %134 = or i32 %72, 5
  %135 = add nsw i32 %134, %42
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = mul nsw i32 %134, %6
  %140 = add nsw i32 %139, %40
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %2, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16
  %144 = fmul contract float %138, %143
  %145 = fadd contract float %133, %144
  %146 = or i32 %72, 6
  %147 = add nsw i32 %146, %42
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = mul nsw i32 %146, %6
  %152 = add nsw i32 %151, %40
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %2, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !16
  %156 = fmul contract float %150, %155
  %157 = fadd contract float %145, %156
  %158 = or i32 %72, 7
  %159 = add nsw i32 %158, %42
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %1, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !16
  %163 = mul nsw i32 %158, %6
  %164 = add nsw i32 %163, %40
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !16
  %168 = fmul contract float %162, %167
  %169 = fadd contract float %157, %168
  %170 = add nuw nsw i32 %72, 8
  %171 = add i32 %74, 8
  %172 = icmp eq i32 %171, %31
  br i1 %172, label %43, label %71, !llvm.loop !24
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
!24 = distinct !{!24, !23}
