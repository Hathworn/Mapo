; ModuleID = '../data/hip_kernels/16910/20/main.cu'
source_filename = "../data/hip_kernels/16910/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15subtract_spikesPKdPKiS2_PKfS2_PfS4_S4_(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = fptosi double %9 to i32
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !4, !amdgpu.noclobber !8
  %13 = fptosi double %12 to i32
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !4, !amdgpu.noclobber !8
  %16 = fptosi double %15 to i32
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !4, !amdgpu.noclobber !8
  %19 = fptosi double %18 to i32
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !4, !amdgpu.noclobber !8
  %22 = fptosi double %21 to i32
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 1
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !10, !amdgpu.noclobber !8
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = add i32 %25, %26
  %28 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !10, !amdgpu.noclobber !8
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %234

30:                                               ; preds = %8
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %32 = icmp slt i32 %31, %16
  %33 = icmp sgt i32 %22, 0
  %34 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %35 = getelementptr i8, i8 addrspace(4)* %34, i64 6
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 12
  %38 = bitcast i8 addrspace(4)* %37 to i32 addrspace(4)*
  %39 = load i32, i32 addrspace(4)* %38, align 4, !tbaa !12
  %40 = getelementptr i8, i8 addrspace(4)* %34, i64 4
  %41 = bitcast i8 addrspace(4)* %40 to i16 addrspace(4)*
  %42 = load i16, i16 addrspace(4)* %41, align 4, !range !21, !invariant.load !8
  %43 = zext i16 %42 to i32
  %44 = udiv i32 %39, %43
  %45 = mul i32 %44, %43
  %46 = icmp ugt i32 %39, %45
  %47 = zext i1 %46 to i32
  %48 = and i32 %22, 7
  %49 = icmp ult i32 %22, 8
  %50 = and i32 %22, -8
  %51 = icmp eq i32 %48, 0
  br label %52

52:                                               ; preds = %30, %230
  %53 = phi i32 [ %27, %30 ], [ %232, %230 ]
  br i1 %32, label %54, label %230

54:                                               ; preds = %52
  %55 = sext i32 %53 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %55
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !10, !amdgpu.noclobber !8
  %60 = load i16, i16 addrspace(4)* %36, align 2, !range !21, !invariant.load !8
  %61 = zext i16 %60 to i32
  br label %62

62:                                               ; preds = %54, %217
  %63 = phi i32 [ %31, %54 ], [ %228, %217 ]
  br i1 %33, label %64, label %217

64:                                               ; preds = %62
  %65 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !10, !amdgpu.noclobber !8
  br i1 %49, label %192, label %66

66:                                               ; preds = %64, %66
  %67 = phi float [ %188, %66 ], [ 0.000000e+00, %64 ]
  %68 = phi i32 [ %189, %66 ], [ 0, %64 ]
  %69 = phi i32 [ %190, %66 ], [ 0, %64 ]
  %70 = mul i32 %68, %19
  %71 = add i32 %65, %70
  %72 = mul i32 %71, %13
  %73 = add i32 %72, %23
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !22
  %77 = mul i32 %71, %16
  %78 = add i32 %77, %63
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %7, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !22
  %82 = fmul contract float %76, %81
  %83 = fadd contract float %67, %82
  %84 = or i32 %68, 1
  %85 = mul i32 %84, %19
  %86 = add i32 %65, %85
  %87 = mul i32 %86, %13
  %88 = add i32 %87, %23
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %6, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !22
  %92 = mul i32 %86, %16
  %93 = add i32 %92, %63
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %7, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !22
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %83, %97
  %99 = or i32 %68, 2
  %100 = mul i32 %99, %19
  %101 = add i32 %65, %100
  %102 = mul i32 %101, %13
  %103 = add i32 %102, %23
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %6, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !22
  %107 = mul i32 %101, %16
  %108 = add i32 %107, %63
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %7, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !22
  %112 = fmul contract float %106, %111
  %113 = fadd contract float %98, %112
  %114 = or i32 %68, 3
  %115 = mul i32 %114, %19
  %116 = add i32 %65, %115
  %117 = mul i32 %116, %13
  %118 = add i32 %117, %23
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %6, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !22
  %122 = mul i32 %116, %16
  %123 = add i32 %122, %63
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %7, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !22
  %127 = fmul contract float %121, %126
  %128 = fadd contract float %113, %127
  %129 = or i32 %68, 4
  %130 = mul i32 %129, %19
  %131 = add i32 %65, %130
  %132 = mul i32 %131, %13
  %133 = add i32 %132, %23
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %6, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !22
  %137 = mul i32 %131, %16
  %138 = add i32 %137, %63
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %7, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !22
  %142 = fmul contract float %136, %141
  %143 = fadd contract float %128, %142
  %144 = or i32 %68, 5
  %145 = mul i32 %144, %19
  %146 = add i32 %65, %145
  %147 = mul i32 %146, %13
  %148 = add i32 %147, %23
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %6, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !22
  %152 = mul i32 %146, %16
  %153 = add i32 %152, %63
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %7, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !22
  %157 = fmul contract float %151, %156
  %158 = fadd contract float %143, %157
  %159 = or i32 %68, 6
  %160 = mul i32 %159, %19
  %161 = add i32 %65, %160
  %162 = mul i32 %161, %13
  %163 = add i32 %162, %23
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %6, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !22
  %167 = mul i32 %161, %16
  %168 = add i32 %167, %63
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %7, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !22
  %172 = fmul contract float %166, %171
  %173 = fadd contract float %158, %172
  %174 = or i32 %68, 7
  %175 = mul i32 %174, %19
  %176 = add i32 %65, %175
  %177 = mul i32 %176, %13
  %178 = add i32 %177, %23
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %6, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !22
  %182 = mul i32 %176, %16
  %183 = add i32 %182, %63
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %7, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !22
  %187 = fmul contract float %181, %186
  %188 = fadd contract float %173, %187
  %189 = add nuw nsw i32 %68, 8
  %190 = add i32 %69, 8
  %191 = icmp eq i32 %190, %50
  br i1 %191, label %192, label %66, !llvm.loop !24

192:                                              ; preds = %66, %64
  %193 = phi float [ undef, %64 ], [ %188, %66 ]
  %194 = phi float [ 0.000000e+00, %64 ], [ %188, %66 ]
  %195 = phi i32 [ 0, %64 ], [ %189, %66 ]
  br i1 %51, label %217, label %196

196:                                              ; preds = %192, %196
  %197 = phi float [ %213, %196 ], [ %194, %192 ]
  %198 = phi i32 [ %214, %196 ], [ %195, %192 ]
  %199 = phi i32 [ %215, %196 ], [ 0, %192 ]
  %200 = mul i32 %198, %19
  %201 = add i32 %65, %200
  %202 = mul i32 %201, %13
  %203 = add i32 %202, %23
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %6, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !22
  %207 = mul i32 %201, %16
  %208 = add i32 %207, %63
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %7, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !22
  %212 = fmul contract float %206, %211
  %213 = fadd contract float %197, %212
  %214 = add nuw nsw i32 %198, 1
  %215 = add i32 %199, 1
  %216 = icmp eq i32 %215, %48
  br i1 %216, label %217, label %196, !llvm.loop !26

217:                                              ; preds = %192, %196, %62
  %218 = phi float [ 0.000000e+00, %62 ], [ %193, %192 ], [ %213, %196 ]
  %219 = load float, float addrspace(1)* %57, align 4, !tbaa !22
  %220 = fmul contract float %218, %219
  %221 = mul nsw i32 %63, %10
  %222 = add i32 %221, %23
  %223 = add i32 %222, %59
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %5, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !22
  %227 = fsub contract float %226, %220
  store float %227, float addrspace(1)* %225, align 4, !tbaa !22
  %228 = add i32 %63, %61
  %229 = icmp slt i32 %228, %16
  br i1 %229, label %62, label %230, !llvm.loop !28

230:                                              ; preds = %217, %52
  %231 = add i32 %44, %53
  %232 = add i32 %231, %47
  %233 = icmp slt i32 %232, %28
  br i1 %233, label %52, label %234, !llvm.loop !29

234:                                              ; preds = %230, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!13, !17, i64 12}
!13 = !{!"hsa_kernel_dispatch_packet_s", !14, i64 0, !14, i64 2, !14, i64 4, !14, i64 6, !14, i64 8, !14, i64 10, !17, i64 12, !17, i64 16, !17, i64 20, !17, i64 24, !17, i64 28, !18, i64 32, !19, i64 40, !18, i64 48, !20, i64 56}
!14 = !{!"short", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!"int", !15, i64 0}
!18 = !{!"long", !15, i64 0}
!19 = !{!"any pointer", !15, i64 0}
!20 = !{!"hsa_signal_s", !18, i64 0}
!21 = !{i16 1, i16 1025}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !6, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.unroll.disable"}
!28 = distinct !{!28, !25}
!29 = distinct !{!29, !25}
