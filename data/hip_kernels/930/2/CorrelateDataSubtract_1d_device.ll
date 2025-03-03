; ModuleID = '../data/hip_kernels/930/2/main.cu'
source_filename = "../data/hip_kernels/930/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24CorrelateDataSubtract_1diiiiiiiiiiiiiiiiPKfS0_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, float addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture readonly %17, float addrspace(1)* nocapture writeonly %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !6
  %29 = mul i32 %20, %25
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = icmp slt i32 %31, %0
  br i1 %32, label %33, label %57

33:                                               ; preds = %19
  %34 = add i32 %10, %7
  %35 = sub i32 0, %10
  %36 = icmp slt i32 %10, 0
  %37 = icmp sgt i32 %15, 0
  %38 = mul nsw i32 %14, %2
  %39 = add i32 %38, %10
  %40 = shl nsw i32 %10, 1
  %41 = add nuw nsw i32 %40, 1
  %42 = mul nsw i32 %41, %41
  %43 = mul nsw i32 %42, %15
  %44 = sitofp i32 %43 to float
  %45 = mul nsw i32 %6, %2
  %46 = udiv i32 %28, %25
  %47 = mul i32 %46, %25
  %48 = icmp ugt i32 %28, %47
  %49 = zext i1 %48 to i32
  %50 = add i32 %46, %49
  %51 = mul i32 %50, %25
  %52 = tail call i32 @llvm.abs.i32(i32 %10, i1 false)
  %53 = and i32 %15, 7
  %54 = icmp ult i32 %15, 8
  %55 = and i32 %15, -8
  %56 = icmp eq i32 %53, 0
  br label %58

57:                                               ; preds = %85, %19
  ret void

58:                                               ; preds = %33, %85
  %59 = phi i32 [ %31, %33 ], [ %91, %85 ]
  %60 = freeze i32 %59
  %61 = freeze i32 %3
  %62 = sdiv i32 %60, %61
  %63 = mul i32 %62, %61
  %64 = sub i32 %60, %63
  %65 = freeze i32 %4
  %66 = sdiv i32 %62, %65
  %67 = srem i32 %66, %5
  %68 = srem i32 %67, %9
  %69 = add nsw i32 %68, %8
  %70 = mul nsw i32 %69, %12
  %71 = mul nsw i32 %64, %11
  %72 = add i32 %34, %71
  br i1 %36, label %85, label %73

73:                                               ; preds = %58
  %74 = mul i32 %66, %65
  %75 = sub i32 %62, %74
  %76 = mul nsw i32 %75, %11
  %77 = add i32 %39, %76
  br label %78

78:                                               ; preds = %73, %101
  %79 = phi float [ 0.000000e+00, %73 ], [ %127, %101 ]
  %80 = phi i32 [ %35, %73 ], [ %102, %101 ]
  %81 = add i32 %77, %80
  %82 = mul nsw i32 %81, %13
  %83 = add i32 %82, %72
  %84 = add i32 %83, %70
  br label %93

85:                                               ; preds = %101, %58
  %86 = phi float [ 0.000000e+00, %58 ], [ %127, %101 ]
  %87 = fdiv contract float %86, %44
  %88 = add nsw i32 %59, %45
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %18, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !16
  %91 = add i32 %51, %59
  %92 = icmp slt i32 %91, %0
  br i1 %92, label %58, label %57, !llvm.loop !20

93:                                               ; preds = %78, %126
  %94 = phi float [ %79, %78 ], [ %127, %126 ]
  %95 = phi i32 [ %35, %78 ], [ %128, %126 ]
  br i1 %37, label %96, label %126

96:                                               ; preds = %93
  %97 = add nsw i32 %83, %95
  %98 = mul nsw i32 %97, %15
  %99 = add i32 %84, %95
  %100 = mul nsw i32 %99, %15
  br i1 %54, label %104, label %130

101:                                              ; preds = %126
  %102 = add i32 %80, 1
  %103 = icmp eq i32 %80, %52
  br i1 %103, label %85, label %78, !llvm.loop !22

104:                                              ; preds = %130, %96
  %105 = phi float [ undef, %96 ], [ %228, %130 ]
  %106 = phi float [ %94, %96 ], [ %228, %130 ]
  %107 = phi i32 [ 0, %96 ], [ %229, %130 ]
  br i1 %56, label %126, label %108

108:                                              ; preds = %104, %108
  %109 = phi float [ %122, %108 ], [ %106, %104 ]
  %110 = phi i32 [ %123, %108 ], [ %107, %104 ]
  %111 = phi i32 [ %124, %108 ], [ 0, %104 ]
  %112 = add nsw i32 %110, %98
  %113 = add nsw i32 %110, %100
  %114 = sext i32 %112 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %16, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16
  %117 = sext i32 %113 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %17, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = fsub contract float %116, %119
  %121 = tail call float @llvm.fabs.f32(float %120)
  %122 = fadd contract float %109, %121
  %123 = add nuw nsw i32 %110, 1
  %124 = add i32 %111, 1
  %125 = icmp eq i32 %124, %53
  br i1 %125, label %126, label %108, !llvm.loop !23

126:                                              ; preds = %104, %108, %93
  %127 = phi float [ %94, %93 ], [ %105, %104 ], [ %122, %108 ]
  %128 = add i32 %95, 1
  %129 = icmp eq i32 %95, %52
  br i1 %129, label %101, label %93, !llvm.loop !25

130:                                              ; preds = %96, %130
  %131 = phi float [ %228, %130 ], [ %94, %96 ]
  %132 = phi i32 [ %229, %130 ], [ 0, %96 ]
  %133 = phi i32 [ %230, %130 ], [ 0, %96 ]
  %134 = add nsw i32 %132, %98
  %135 = add nsw i32 %132, %100
  %136 = sext i32 %134 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %16, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = sext i32 %135 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %17, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %142 = fsub contract float %138, %141
  %143 = tail call float @llvm.fabs.f32(float %142)
  %144 = fadd contract float %131, %143
  %145 = or i32 %132, 1
  %146 = add nsw i32 %145, %98
  %147 = add nsw i32 %145, %100
  %148 = sext i32 %146 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %16, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = sext i32 %147 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %17, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !16
  %154 = fsub contract float %150, %153
  %155 = tail call float @llvm.fabs.f32(float %154)
  %156 = fadd contract float %144, %155
  %157 = or i32 %132, 2
  %158 = add nsw i32 %157, %98
  %159 = add nsw i32 %157, %100
  %160 = sext i32 %158 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %16, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !16
  %163 = sext i32 %159 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %17, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !16
  %166 = fsub contract float %162, %165
  %167 = tail call float @llvm.fabs.f32(float %166)
  %168 = fadd contract float %156, %167
  %169 = or i32 %132, 3
  %170 = add nsw i32 %169, %98
  %171 = add nsw i32 %169, %100
  %172 = sext i32 %170 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %16, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16
  %175 = sext i32 %171 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %17, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !16
  %178 = fsub contract float %174, %177
  %179 = tail call float @llvm.fabs.f32(float %178)
  %180 = fadd contract float %168, %179
  %181 = or i32 %132, 4
  %182 = add nsw i32 %181, %98
  %183 = add nsw i32 %181, %100
  %184 = sext i32 %182 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %16, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !16
  %187 = sext i32 %183 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %17, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !16
  %190 = fsub contract float %186, %189
  %191 = tail call float @llvm.fabs.f32(float %190)
  %192 = fadd contract float %180, %191
  %193 = or i32 %132, 5
  %194 = add nsw i32 %193, %98
  %195 = add nsw i32 %193, %100
  %196 = sext i32 %194 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %16, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !16
  %199 = sext i32 %195 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %17, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !16
  %202 = fsub contract float %198, %201
  %203 = tail call float @llvm.fabs.f32(float %202)
  %204 = fadd contract float %192, %203
  %205 = or i32 %132, 6
  %206 = add nsw i32 %205, %98
  %207 = add nsw i32 %205, %100
  %208 = sext i32 %206 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %16, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !16
  %211 = sext i32 %207 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %17, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !16
  %214 = fsub contract float %210, %213
  %215 = tail call float @llvm.fabs.f32(float %214)
  %216 = fadd contract float %204, %215
  %217 = or i32 %132, 7
  %218 = add nsw i32 %217, %98
  %219 = add nsw i32 %217, %100
  %220 = sext i32 %218 to i64
  %221 = getelementptr inbounds float, float addrspace(1)* %16, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !16
  %223 = sext i32 %219 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %17, i64 %223
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !16
  %226 = fsub contract float %222, %225
  %227 = tail call float @llvm.fabs.f32(float %226)
  %228 = fadd contract float %216, %227
  %229 = add nuw nsw i32 %132, 8
  %230 = add i32 %133, 8
  %231 = icmp eq i32 %230, %55
  br i1 %231, label %104, label %130, !llvm.loop !26
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

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
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
