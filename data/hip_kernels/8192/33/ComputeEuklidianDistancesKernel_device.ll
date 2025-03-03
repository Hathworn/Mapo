; ModuleID = '../data/hip_kernels/8192/33/main.cu'
source_filename = "../data/hip_kernels/8192/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31ComputeEuklidianDistancesKernelPfiiS_S_ii(float addrspace(1)* nocapture readnone %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = icmp slt i32 %27, %6
  br i1 %28, label %29, label %168

29:                                               ; preds = %7
  %30 = freeze i32 %27
  %31 = freeze i32 %1
  %32 = sdiv i32 %30, %31
  %33 = mul i32 %32, %31
  %34 = sub i32 %30, %33
  %35 = sitofp i32 %34 to float
  %36 = sitofp i32 %32 to float
  %37 = icmp sgt i32 %5, 0
  br i1 %37, label %38, label %168

38:                                               ; preds = %29
  %39 = and i32 %5, 1
  %40 = icmp eq i32 %5, 1
  br i1 %40, label %126, label %41

41:                                               ; preds = %38
  %42 = and i32 %5, -2
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi i32 [ 0, %41 ], [ %123, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %124, %43 ]
  %46 = shl nuw nsw i32 %44, 1
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %50 = add nuw nsw i32 %46, 1
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = fsub contract float %49, %35
  %55 = fmul contract float %54, %54
  %56 = fsub contract float %53, %36
  %57 = fmul contract float %56, %56
  %58 = fadd contract float %55, %57
  %59 = fcmp olt float %58, 0x39F0000000000000
  %60 = select i1 %59, float 0x41F0000000000000, float 1.000000e+00
  %61 = fmul float %58, %60
  %62 = tail call float @llvm.sqrt.f32(float %61)
  %63 = bitcast float %62 to i32
  %64 = add nsw i32 %63, -1
  %65 = bitcast i32 %64 to float
  %66 = add nsw i32 %63, 1
  %67 = bitcast i32 %66 to float
  %68 = tail call i1 @llvm.amdgcn.class.f32(float %61, i32 608)
  %69 = select i1 %59, float 0x3EF0000000000000, float 1.000000e+00
  %70 = fneg float %67
  %71 = tail call float @llvm.fma.f32(float %70, float %62, float %61)
  %72 = fcmp ogt float %71, 0.000000e+00
  %73 = fneg float %65
  %74 = tail call float @llvm.fma.f32(float %73, float %62, float %61)
  %75 = fcmp ole float %74, 0.000000e+00
  %76 = select i1 %75, float %65, float %62
  %77 = select i1 %72, float %67, float %76
  %78 = fmul float %69, %77
  %79 = select i1 %68, float %61, float %78
  %80 = mul nsw i32 %44, %6
  %81 = add nsw i32 %80, %27
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %4, i64 %82
  store float %79, float addrspace(1)* %83, align 4, !tbaa !16
  %84 = or i32 %44, 1
  %85 = shl nuw nsw i32 %84, 1
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = add nuw nsw i32 %85, 1
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %3, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = fsub contract float %88, %35
  %94 = fmul contract float %93, %93
  %95 = fsub contract float %92, %36
  %96 = fmul contract float %95, %95
  %97 = fadd contract float %94, %96
  %98 = fcmp olt float %97, 0x39F0000000000000
  %99 = select i1 %98, float 0x41F0000000000000, float 1.000000e+00
  %100 = fmul float %97, %99
  %101 = tail call float @llvm.sqrt.f32(float %100)
  %102 = bitcast float %101 to i32
  %103 = add nsw i32 %102, -1
  %104 = bitcast i32 %103 to float
  %105 = add nsw i32 %102, 1
  %106 = bitcast i32 %105 to float
  %107 = tail call i1 @llvm.amdgcn.class.f32(float %100, i32 608)
  %108 = select i1 %98, float 0x3EF0000000000000, float 1.000000e+00
  %109 = fneg float %106
  %110 = tail call float @llvm.fma.f32(float %109, float %101, float %100)
  %111 = fcmp ogt float %110, 0.000000e+00
  %112 = fneg float %104
  %113 = tail call float @llvm.fma.f32(float %112, float %101, float %100)
  %114 = fcmp ole float %113, 0.000000e+00
  %115 = select i1 %114, float %104, float %101
  %116 = select i1 %111, float %106, float %115
  %117 = fmul float %108, %116
  %118 = select i1 %107, float %100, float %117
  %119 = mul nsw i32 %84, %6
  %120 = add nsw i32 %119, %27
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %4, i64 %121
  store float %118, float addrspace(1)* %122, align 4, !tbaa !16
  %123 = add nuw nsw i32 %44, 2
  %124 = add nuw i32 %45, 2
  %125 = icmp eq i32 %124, %42
  br i1 %125, label %126, label %43, !llvm.loop !20

126:                                              ; preds = %43, %38
  %127 = phi i32 [ 0, %38 ], [ %123, %43 ]
  %128 = icmp eq i32 %39, 0
  br i1 %128, label %168, label %129

129:                                              ; preds = %126
  %130 = shl nuw nsw i32 %127, 1
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %3, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16
  %134 = add nuw nsw i32 %130, 1
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16
  %138 = fsub contract float %133, %35
  %139 = fmul contract float %138, %138
  %140 = fsub contract float %137, %36
  %141 = fmul contract float %140, %140
  %142 = fadd contract float %139, %141
  %143 = fcmp olt float %142, 0x39F0000000000000
  %144 = select i1 %143, float 0x41F0000000000000, float 1.000000e+00
  %145 = fmul float %142, %144
  %146 = tail call float @llvm.sqrt.f32(float %145)
  %147 = bitcast float %146 to i32
  %148 = add nsw i32 %147, -1
  %149 = bitcast i32 %148 to float
  %150 = add nsw i32 %147, 1
  %151 = bitcast i32 %150 to float
  %152 = tail call i1 @llvm.amdgcn.class.f32(float %145, i32 608)
  %153 = select i1 %143, float 0x3EF0000000000000, float 1.000000e+00
  %154 = fneg float %151
  %155 = tail call float @llvm.fma.f32(float %154, float %146, float %145)
  %156 = fcmp ogt float %155, 0.000000e+00
  %157 = fneg float %149
  %158 = tail call float @llvm.fma.f32(float %157, float %146, float %145)
  %159 = fcmp ole float %158, 0.000000e+00
  %160 = select i1 %159, float %149, float %146
  %161 = select i1 %156, float %151, float %160
  %162 = fmul float %153, %161
  %163 = select i1 %152, float %145, float %162
  %164 = mul nsw i32 %127, %6
  %165 = add nsw i32 %164, %27
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %4, i64 %166
  store float %163, float addrspace(1)* %167, align 4, !tbaa !16
  br label %168

168:                                              ; preds = %129, %126, %29, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!21 = !{!"llvm.loop.mustprogress"}
