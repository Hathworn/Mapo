; ModuleID = '../data/hip_kernels/10516/0/main.cu'
source_filename = "../data/hip_kernels/10516/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26extract_with_interpolationiPfS_S_iiii(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = mul i32 %9, %14
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %0
  br i1 %21, label %22, label %36

22:                                               ; preds = %8
  %23 = add nsw i32 %7, -1
  %24 = add nsw i32 %6, -1
  %25 = icmp sgt i32 %5, 0
  %26 = udiv i32 %17, %14
  %27 = mul i32 %26, %14
  %28 = icmp ugt i32 %17, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %14
  %32 = and i32 %5, 1
  %33 = icmp eq i32 %5, 1
  %34 = and i32 %5, -2
  %35 = icmp eq i32 %32, 0
  br label %37

36:                                               ; preds = %126, %8
  ret void

37:                                               ; preds = %22, %126
  %38 = phi i32 [ %20, %22 ], [ %127, %126 ]
  %39 = freeze i32 %38
  %40 = freeze i32 %4
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %41, %5
  %43 = shl nsw i32 %38, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16
  %47 = add nuw nsw i32 %43, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = tail call float @llvm.floor.f32(float %46)
  %52 = fptosi float %51 to i32
  %53 = add nsw i32 %52, 1
  %54 = tail call float @llvm.floor.f32(float %50)
  %55 = fptosi float %54 to i32
  %56 = add nsw i32 %55, 1
  %57 = tail call i32 @llvm.smin.i32(i32 %23, i32 %52)
  %58 = icmp sgt i32 %52, 0
  %59 = select i1 %58, i32 %57, i32 0
  %60 = tail call i32 @llvm.smin.i32(i32 %24, i32 %55)
  %61 = icmp sgt i32 %55, 0
  %62 = select i1 %61, i32 %60, i32 0
  %63 = icmp slt i32 %52, 0
  %64 = tail call i32 @llvm.smin.i32(i32 %53, i32 %23)
  %65 = select i1 %63, i32 0, i32 %64
  %66 = icmp slt i32 %55, 0
  %67 = tail call i32 @llvm.smin.i32(i32 %56, i32 %24)
  %68 = select i1 %66, i32 0, i32 %67
  %69 = sitofp i32 %65 to float
  %70 = fsub contract float %69, %46
  %71 = sitofp i32 %59 to float
  %72 = fsub contract float %46, %71
  %73 = sitofp i32 %68 to float
  %74 = fsub contract float %73, %50
  %75 = sitofp i32 %62 to float
  %76 = fsub contract float %50, %75
  %77 = icmp eq i32 %59, %65
  %78 = select i1 %77, float 1.000000e+00, float %70
  %79 = select i1 %77, float 0.000000e+00, float %72
  %80 = icmp eq i32 %62, %68
  %81 = select i1 %80, float 1.000000e+00, float %74
  %82 = select i1 %80, float 0.000000e+00, float %76
  br i1 %25, label %83, label %126

83:                                               ; preds = %37
  %84 = fmul contract float %78, %81
  %85 = fmul contract float %82, %78
  %86 = fmul contract float %79, %81
  %87 = fmul contract float %79, %82
  %88 = mul i32 %41, %40
  %89 = sub i32 %39, %88
  br i1 %33, label %90, label %129

90:                                               ; preds = %129, %83
  %91 = phi i32 [ 0, %83 ], [ %199, %129 ]
  br i1 %35, label %126, label %92

92:                                               ; preds = %90
  %93 = add i32 %91, %42
  %94 = mul nsw i32 %93, %6
  %95 = add nsw i32 %94, %62
  %96 = mul nsw i32 %95, %7
  %97 = add nsw i32 %96, %59
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fmul contract float %84, %100
  %102 = add nsw i32 %94, %68
  %103 = mul nsw i32 %102, %7
  %104 = add nsw i32 %103, %59
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fmul contract float %85, %107
  %109 = fadd contract float %101, %108
  %110 = add nsw i32 %96, %65
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %114 = fmul contract float %86, %113
  %115 = fadd contract float %109, %114
  %116 = add nsw i32 %103, %65
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = fmul contract float %87, %119
  %121 = fadd contract float %115, %120
  %122 = mul i32 %93, %4
  %123 = add i32 %89, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %3, i64 %124
  store float %121, float addrspace(1)* %125, align 4, !tbaa !16
  br label %126

126:                                              ; preds = %92, %90, %37
  %127 = add i32 %31, %38
  %128 = icmp slt i32 %127, %0
  br i1 %128, label %37, label %36, !llvm.loop !20

129:                                              ; preds = %83, %129
  %130 = phi i32 [ %199, %129 ], [ 0, %83 ]
  %131 = phi i32 [ %200, %129 ], [ 0, %83 ]
  %132 = add i32 %130, %42
  %133 = mul nsw i32 %132, %6
  %134 = add nsw i32 %133, %62
  %135 = mul nsw i32 %134, %7
  %136 = add nsw i32 %135, %59
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fmul contract float %84, %139
  %141 = add nsw i32 %133, %68
  %142 = mul nsw i32 %141, %7
  %143 = add nsw i32 %142, %59
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = fmul contract float %85, %146
  %148 = fadd contract float %140, %147
  %149 = add nsw i32 %135, %65
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !16
  %153 = fmul contract float %86, %152
  %154 = fadd contract float %148, %153
  %155 = add nsw i32 %142, %65
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !16
  %159 = fmul contract float %87, %158
  %160 = fadd contract float %154, %159
  %161 = mul i32 %132, %4
  %162 = add i32 %89, %161
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %3, i64 %163
  store float %160, float addrspace(1)* %164, align 4, !tbaa !16
  %165 = or i32 %130, 1
  %166 = add i32 %165, %42
  %167 = mul nsw i32 %166, %6
  %168 = add nsw i32 %167, %62
  %169 = mul nsw i32 %168, %7
  %170 = add nsw i32 %169, %59
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !16
  %174 = fmul contract float %84, %173
  %175 = add nsw i32 %167, %68
  %176 = mul nsw i32 %175, %7
  %177 = add nsw i32 %176, %59
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !16
  %181 = fmul contract float %85, %180
  %182 = fadd contract float %174, %181
  %183 = add nsw i32 %169, %65
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !16
  %187 = fmul contract float %86, %186
  %188 = fadd contract float %182, %187
  %189 = add nsw i32 %176, %65
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %1, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !16
  %193 = fmul contract float %87, %192
  %194 = fadd contract float %188, %193
  %195 = mul i32 %166, %4
  %196 = add i32 %89, %195
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %3, i64 %197
  store float %194, float addrspace(1)* %198, align 4, !tbaa !16
  %199 = add nuw nsw i32 %130, 2
  %200 = add i32 %131, 2
  %201 = icmp eq i32 %200, %34
  br i1 %201, label %90, label %129, !llvm.loop !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
