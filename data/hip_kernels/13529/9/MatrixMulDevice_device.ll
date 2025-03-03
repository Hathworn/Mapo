; ModuleID = '../data/hip_kernels/13529/9/main.cu'
source_filename = "../data/hip_kernels/13529/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15MatrixMulDevicePfS_S_Pi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !4, !amdgpu.noclobber !8
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !9
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !18, !invariant.load !8
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = udiv i32 %5, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %19, %20
  %22 = add i32 %19, -1
  %23 = add i32 %22, %21
  %24 = icmp ult i32 %21, %23
  br i1 %24, label %25, label %186

25:                                               ; preds = %4
  %26 = icmp sgt i32 %5, 0
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %28 = and i32 %5, 7
  %29 = icmp ult i32 %5, 8
  %30 = and i32 %5, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %25, %178
  %33 = phi i32 [ %21, %25 ], [ %184, %178 ]
  %34 = mul nsw i32 %33, %5
  br i1 %26, label %35, label %178

35:                                               ; preds = %32
  br i1 %29, label %154, label %36

36:                                               ; preds = %35, %36
  %37 = phi i32 [ %151, %36 ], [ 0, %35 ]
  %38 = phi i32 [ %150, %36 ], [ 0, %35 ]
  %39 = phi i32 [ %152, %36 ], [ 0, %35 ]
  %40 = add nsw i32 %37, %34
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !19
  %44 = mul nsw i32 %37, %5
  %45 = add i32 %44, %27
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !19
  %49 = fmul contract float %43, %48
  %50 = sitofp i32 %38 to float
  %51 = fadd contract float %49, %50
  %52 = fptosi float %51 to i32
  %53 = or i32 %37, 1
  %54 = add nsw i32 %53, %34
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !19
  %58 = mul nsw i32 %53, %5
  %59 = add i32 %58, %27
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !19
  %63 = fmul contract float %57, %62
  %64 = sitofp i32 %52 to float
  %65 = fadd contract float %63, %64
  %66 = fptosi float %65 to i32
  %67 = or i32 %37, 2
  %68 = add nsw i32 %67, %34
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !19
  %72 = mul nsw i32 %67, %5
  %73 = add i32 %72, %27
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !19
  %77 = fmul contract float %71, %76
  %78 = sitofp i32 %66 to float
  %79 = fadd contract float %77, %78
  %80 = fptosi float %79 to i32
  %81 = or i32 %37, 3
  %82 = add nsw i32 %81, %34
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !19
  %86 = mul nsw i32 %81, %5
  %87 = add i32 %86, %27
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !19
  %91 = fmul contract float %85, %90
  %92 = sitofp i32 %80 to float
  %93 = fadd contract float %91, %92
  %94 = fptosi float %93 to i32
  %95 = or i32 %37, 4
  %96 = add nsw i32 %95, %34
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !19
  %100 = mul nsw i32 %95, %5
  %101 = add i32 %100, %27
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !19
  %105 = fmul contract float %99, %104
  %106 = sitofp i32 %94 to float
  %107 = fadd contract float %105, %106
  %108 = fptosi float %107 to i32
  %109 = or i32 %37, 5
  %110 = add nsw i32 %109, %34
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !19
  %114 = mul nsw i32 %109, %5
  %115 = add i32 %114, %27
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !19
  %119 = fmul contract float %113, %118
  %120 = sitofp i32 %108 to float
  %121 = fadd contract float %119, %120
  %122 = fptosi float %121 to i32
  %123 = or i32 %37, 6
  %124 = add nsw i32 %123, %34
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !19
  %128 = mul nsw i32 %123, %5
  %129 = add i32 %128, %27
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !19
  %133 = fmul contract float %127, %132
  %134 = sitofp i32 %122 to float
  %135 = fadd contract float %133, %134
  %136 = fptosi float %135 to i32
  %137 = or i32 %37, 7
  %138 = add nsw i32 %137, %34
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !19
  %142 = mul nsw i32 %137, %5
  %143 = add i32 %142, %27
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !19
  %147 = fmul contract float %141, %146
  %148 = sitofp i32 %136 to float
  %149 = fadd contract float %147, %148
  %150 = fptosi float %149 to i32
  %151 = add nuw nsw i32 %37, 8
  %152 = add i32 %39, 8
  %153 = icmp eq i32 %152, %30
  br i1 %153, label %154, label %36, !llvm.loop !21

154:                                              ; preds = %36, %35
  %155 = phi i32 [ undef, %35 ], [ %150, %36 ]
  %156 = phi i32 [ 0, %35 ], [ %151, %36 ]
  %157 = phi i32 [ 0, %35 ], [ %150, %36 ]
  br i1 %31, label %178, label %158

158:                                              ; preds = %154, %158
  %159 = phi i32 [ %175, %158 ], [ %156, %154 ]
  %160 = phi i32 [ %174, %158 ], [ %157, %154 ]
  %161 = phi i32 [ %176, %158 ], [ 0, %154 ]
  %162 = add nsw i32 %159, %34
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !19
  %166 = mul nsw i32 %159, %5
  %167 = add i32 %166, %27
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !19
  %171 = fmul contract float %165, %170
  %172 = sitofp i32 %160 to float
  %173 = fadd contract float %171, %172
  %174 = fptosi float %173 to i32
  %175 = add nuw nsw i32 %159, 1
  %176 = add i32 %161, 1
  %177 = icmp eq i32 %176, %28
  br i1 %177, label %178, label %158, !llvm.loop !23

178:                                              ; preds = %154, %158, %32
  %179 = phi i32 [ 0, %32 ], [ %155, %154 ], [ %174, %158 ]
  %180 = sitofp i32 %179 to float
  %181 = add i32 %34, %27
  %182 = zext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %2, i64 %182
  store float %180, float addrspace(1)* %183, align 4, !tbaa !19
  %184 = add nuw nsw i32 %33, 1
  %185 = icmp eq i32 %184, %23
  br i1 %185, label %186, label %32, !llvm.loop !25

186:                                              ; preds = %178, %4
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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !14, i64 12}
!10 = !{!"hsa_kernel_dispatch_packet_s", !11, i64 0, !11, i64 2, !11, i64 4, !11, i64 6, !11, i64 8, !11, i64 10, !14, i64 12, !14, i64 16, !14, i64 20, !14, i64 24, !14, i64 28, !15, i64 32, !16, i64 40, !15, i64 48, !17, i64 56}
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!"int", !12, i64 0}
!15 = !{!"long", !12, i64 0}
!16 = !{!"any pointer", !12, i64 0}
!17 = !{!"hsa_signal_s", !15, i64 0}
!18 = !{i16 1, i16 1025}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !6, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !22}
