; ModuleID = '../data/hip_kernels/1574/32/main.cu'
source_filename = "../data/hip_kernels/1574/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11computeCostPKdPKfS2_S2_PKiPKbPf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i8 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !9, !invariant.load !8
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 5
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptrunc double %20 to float
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %23 = icmp slt i32 %22, %9
  br i1 %23, label %24, label %190

24:                                               ; preds = %7
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !4, !amdgpu.noclobber !8
  %27 = fptosi double %26 to i32
  %28 = mul nsw i32 %18, %9
  %29 = icmp sgt i32 %12, 0
  %30 = mul nsw i32 %18, %27
  %31 = sext i32 %18 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = and i32 %12, 7
  %34 = icmp ult i32 %12, 8
  %35 = and i32 %12, -8
  %36 = icmp eq i32 %33, 0
  br label %37

37:                                               ; preds = %24, %187
  %38 = phi i32 [ %22, %24 ], [ %188, %187 ]
  %39 = add nsw i32 %38, %28
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %187, label %44

44:                                               ; preds = %37
  br i1 %29, label %45, label %174

45:                                               ; preds = %44
  %46 = mul nsw i32 %38, %12
  %47 = zext i32 %38 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !14, !amdgpu.noclobber !8
  br i1 %34, label %152, label %50

50:                                               ; preds = %45, %50
  %51 = phi i32 [ %149, %50 ], [ 0, %45 ]
  %52 = phi float [ %148, %50 ], [ 0.000000e+00, %45 ]
  %53 = phi i32 [ %150, %50 ], [ 0, %45 ]
  %54 = add nsw i32 %51, %46
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = add i32 %51, %30
  %59 = add i32 %58, %49
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = fmul contract float %57, %62
  %64 = fadd contract float %52, %63
  %65 = or i32 %51, 1
  %66 = add nsw i32 %65, %46
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = add i32 %65, %30
  %71 = add i32 %70, %49
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = fmul contract float %69, %74
  %76 = fadd contract float %64, %75
  %77 = or i32 %51, 2
  %78 = add nsw i32 %77, %46
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16
  %82 = add i32 %77, %30
  %83 = add i32 %82, %49
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fmul contract float %81, %86
  %88 = fadd contract float %76, %87
  %89 = or i32 %51, 3
  %90 = add nsw i32 %89, %46
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = add i32 %89, %30
  %95 = add i32 %94, %49
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %3, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %88, %99
  %101 = or i32 %51, 4
  %102 = add nsw i32 %101, %46
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16
  %106 = add i32 %101, %30
  %107 = add i32 %106, %49
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %100, %111
  %113 = or i32 %51, 5
  %114 = add nsw i32 %113, %46
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = add i32 %113, %30
  %119 = add i32 %118, %49
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %3, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = fmul contract float %117, %122
  %124 = fadd contract float %112, %123
  %125 = or i32 %51, 6
  %126 = add nsw i32 %125, %46
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !16
  %130 = add i32 %125, %30
  %131 = add i32 %130, %49
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %3, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = fmul contract float %129, %134
  %136 = fadd contract float %124, %135
  %137 = or i32 %51, 7
  %138 = add nsw i32 %137, %46
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %142 = add i32 %137, %30
  %143 = add i32 %142, %49
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %3, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %136, %147
  %149 = add nuw nsw i32 %51, 8
  %150 = add i32 %53, 8
  %151 = icmp eq i32 %150, %35
  br i1 %151, label %152, label %50, !llvm.loop !18

152:                                              ; preds = %50, %45
  %153 = phi float [ undef, %45 ], [ %148, %50 ]
  %154 = phi i32 [ 0, %45 ], [ %149, %50 ]
  %155 = phi float [ 0.000000e+00, %45 ], [ %148, %50 ]
  br i1 %36, label %174, label %156

156:                                              ; preds = %152, %156
  %157 = phi i32 [ %171, %156 ], [ %154, %152 ]
  %158 = phi float [ %170, %156 ], [ %155, %152 ]
  %159 = phi i32 [ %172, %156 ], [ 0, %152 ]
  %160 = add nsw i32 %157, %46
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !16
  %164 = add i32 %157, %30
  %165 = add i32 %164, %49
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %3, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !16
  %169 = fmul contract float %163, %168
  %170 = fadd contract float %158, %169
  %171 = add nuw nsw i32 %157, 1
  %172 = add i32 %159, 1
  %173 = icmp eq i32 %172, %33
  br i1 %173, label %174, label %156, !llvm.loop !20

174:                                              ; preds = %152, %156, %44
  %175 = phi float [ 0.000000e+00, %44 ], [ %153, %152 ], [ %170, %156 ]
  %176 = tail call float @llvm.maxnum.f32(float %175, float 0.000000e+00)
  %177 = load float, float addrspace(1)* %32, align 4, !tbaa !16
  %178 = fdiv contract float %21, %177
  %179 = fadd contract float %176, %178
  %180 = fmul contract float %179, %179
  %181 = fmul contract float %177, %177
  %182 = fdiv contract float %21, %181
  %183 = fadd contract float %182, 1.000000e+00
  %184 = fdiv contract float %180, %183
  %185 = fsub contract float %184, %21
  %186 = getelementptr inbounds float, float addrspace(1)* %6, i64 %40
  store float %185, float addrspace(1)* %186, align 4, !tbaa !16
  br label %187

187:                                              ; preds = %174, %37
  %188 = add nuw nsw i32 %38, %17
  %189 = icmp slt i32 %188, %9
  br i1 %189, label %37, label %190, !llvm.loop !22

190:                                              ; preds = %187, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"bool", !6, i64 0}
!13 = !{i8 0, i8 2}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !6, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !6, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !19}
