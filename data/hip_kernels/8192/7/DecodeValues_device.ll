; ModuleID = '../data/hip_kernels/8192/7/main.cu'
source_filename = "../data/hip_kernels/8192/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12DecodeValuesPfiS_S_iiS_S_S_S_S_S_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = udiv i32 %20, %17
  %24 = mul i32 %23, %17
  %25 = icmp ugt i32 %20, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %30 = add i32 %28, %21
  %31 = mul i32 %30, %17
  %32 = add i32 %31, %29
  %33 = icmp slt i32 %32, %4
  br i1 %33, label %34, label %164

34:                                               ; preds = %12
  %35 = sext i32 %32 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  store float 0.000000e+00, float addrspace(1)* %36, align 4, !tbaa !16
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  store float 0.000000e+00, float addrspace(1)* %37, align 4, !tbaa !16
  %38 = icmp eq i32 %32, 0
  %39 = select i1 %38, float addrspace(1)* %6, float addrspace(1)* %7
  %40 = select i1 %38, float addrspace(1)* %8, float addrspace(1)* %9
  %41 = select i1 %38, float addrspace(1)* %10, float addrspace(1)* %11
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %43, label %76

43:                                               ; preds = %34
  %44 = and i32 %1, 3
  %45 = icmp ult i32 %1, 4
  br i1 %45, label %48, label %46

46:                                               ; preds = %43
  %47 = and i32 %1, -4
  br label %83

48:                                               ; preds = %83, %43
  %49 = phi float [ undef, %43 ], [ %160, %83 ]
  %50 = phi i32 [ 0, %43 ], [ %161, %83 ]
  %51 = icmp eq i32 %44, 0
  br i1 %51, label %76, label %52

52:                                               ; preds = %48, %52
  %53 = phi i32 [ %73, %52 ], [ %50, %48 ]
  %54 = phi i32 [ %74, %52 ], [ 0, %48 ]
  %55 = zext i32 %53 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = getelementptr inbounds float, float addrspace(1)* %39, i64 %55
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fmul contract float %57, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %40, i64 %55
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = fmul contract float %57, %62
  %64 = fsub contract float %60, %63
  %65 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %66 = fadd contract float %65, %64
  store float %66, float addrspace(1)* %36, align 4, !tbaa !16
  %67 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %68 = getelementptr inbounds float, float addrspace(1)* %41, i64 %55
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fmul contract float %67, %69
  %71 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %72 = fadd contract float %71, %70
  store float %72, float addrspace(1)* %37, align 4, !tbaa !16
  %73 = add nuw nsw i32 %53, 1
  %74 = add i32 %54, 1
  %75 = icmp eq i32 %74, %44
  br i1 %75, label %76, label %52, !llvm.loop !20

76:                                               ; preds = %48, %52, %34
  %77 = phi float [ 0.000000e+00, %34 ], [ %49, %48 ], [ %72, %52 ]
  %78 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %79 = tail call float @llvm.fabs.f32(float %78)
  %80 = fadd contract float %77, %79
  store float %80, float addrspace(1)* %37, align 4, !tbaa !16
  %81 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %82 = fdiv contract float %81, %80
  store float %82, float addrspace(1)* %36, align 4, !tbaa !16
  br label %164

83:                                               ; preds = %83, %46
  %84 = phi i32 [ 0, %46 ], [ %161, %83 ]
  %85 = phi i32 [ 0, %46 ], [ %162, %83 ]
  %86 = zext i32 %84 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %39, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fmul contract float %88, %90
  %92 = getelementptr inbounds float, float addrspace(1)* %40, i64 %86
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = fmul contract float %88, %93
  %95 = fsub contract float %91, %94
  %96 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %97 = fadd contract float %96, %95
  store float %97, float addrspace(1)* %36, align 4, !tbaa !16
  %98 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %99 = getelementptr inbounds float, float addrspace(1)* %41, i64 %86
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fmul contract float %98, %100
  %102 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %103 = fadd contract float %102, %101
  store float %103, float addrspace(1)* %37, align 4, !tbaa !16
  %104 = or i32 %84, 1
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = getelementptr inbounds float, float addrspace(1)* %39, i64 %105
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %110 = fmul contract float %107, %109
  %111 = getelementptr inbounds float, float addrspace(1)* %40, i64 %105
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = fmul contract float %107, %112
  %114 = fsub contract float %110, %113
  %115 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %116 = fadd contract float %115, %114
  store float %116, float addrspace(1)* %36, align 4, !tbaa !16
  %117 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %118 = getelementptr inbounds float, float addrspace(1)* %41, i64 %105
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = fmul contract float %117, %119
  %121 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %122 = fadd contract float %121, %120
  store float %122, float addrspace(1)* %37, align 4, !tbaa !16
  %123 = or i32 %84, 2
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = getelementptr inbounds float, float addrspace(1)* %39, i64 %124
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16
  %129 = fmul contract float %126, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %40, i64 %124
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %132 = fmul contract float %126, %131
  %133 = fsub contract float %129, %132
  %134 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %135 = fadd contract float %134, %133
  store float %135, float addrspace(1)* %36, align 4, !tbaa !16
  %136 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %137 = getelementptr inbounds float, float addrspace(1)* %41, i64 %124
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = fmul contract float %136, %138
  %140 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %141 = fadd contract float %140, %139
  store float %141, float addrspace(1)* %37, align 4, !tbaa !16
  %142 = or i32 %84, 3
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16
  %146 = getelementptr inbounds float, float addrspace(1)* %39, i64 %143
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16
  %148 = fmul contract float %145, %147
  %149 = getelementptr inbounds float, float addrspace(1)* %40, i64 %143
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = fmul contract float %145, %150
  %152 = fsub contract float %148, %151
  %153 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %154 = fadd contract float %153, %152
  store float %154, float addrspace(1)* %36, align 4, !tbaa !16
  %155 = load float, float addrspace(1)* %144, align 4, !tbaa !16
  %156 = getelementptr inbounds float, float addrspace(1)* %41, i64 %143
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !16
  %158 = fmul contract float %155, %157
  %159 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %160 = fadd contract float %159, %158
  store float %160, float addrspace(1)* %37, align 4, !tbaa !16
  %161 = add nuw nsw i32 %84, 4
  %162 = add i32 %85, 4
  %163 = icmp eq i32 %162, %47
  br i1 %163, label %48, label %83, !llvm.loop !22

164:                                              ; preds = %12, %76
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
