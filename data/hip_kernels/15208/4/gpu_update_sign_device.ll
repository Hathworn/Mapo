; ModuleID = '../data/hip_kernels/15208/4/main.cu'
source_filename = "../data/hip_kernels/15208/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15gpu_update_signPiPdS_iiS_S_ii(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !4
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !13, !invariant.load !14
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %7
  %25 = add i32 %24, %10
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = mul i32 %18, %8
  %28 = add i32 %27, %26
  %29 = icmp ult i32 %25, %4
  %30 = icmp ult i32 %28, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %242

32:                                               ; preds = %9
  %33 = icmp sgt i32 %3, 0
  br i1 %33, label %34, label %47

34:                                               ; preds = %32
  %35 = mul nsw i32 %25, %4
  %36 = add i32 %35, %28
  %37 = mul i32 %3, %3
  %38 = mul i32 %37, %36
  %39 = and i32 %3, 7
  %40 = icmp ult i32 %3, 8
  %41 = and i32 %3, -8
  %42 = icmp eq i32 %39, 0
  br label %43

43:                                               ; preds = %34, %75
  %44 = phi i32 [ 0, %34 ], [ %77, %75 ]
  %45 = phi double [ 0.000000e+00, %34 ], [ %76, %75 ]
  %46 = mul nsw i32 %44, %3
  br i1 %40, label %50, label %79

47:                                               ; preds = %75, %32
  %48 = phi double [ 0.000000e+00, %32 ], [ %76, %75 ]
  %49 = fcmp contract ogt double %48, 0x3EB0C6F7A0B5ED8D
  br i1 %49, label %205, label %218

50:                                               ; preds = %79, %43
  %51 = phi double [ undef, %43 ], [ %201, %79 ]
  %52 = phi i32 [ 0, %43 ], [ %202, %79 ]
  %53 = phi double [ %45, %43 ], [ %201, %79 ]
  br i1 %42, label %75, label %54

54:                                               ; preds = %50, %54
  %55 = phi i32 [ %72, %54 ], [ %52, %50 ]
  %56 = phi double [ %71, %54 ], [ %53, %50 ]
  %57 = phi i32 [ %73, %54 ], [ 0, %50 ]
  %58 = add i32 %55, %46
  %59 = add i32 %58, %38
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !14
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !14
  %66 = sitofp i32 %65 to double
  %67 = sext i32 %58 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !20, !amdgpu.noclobber !14
  %70 = fmul contract double %69, %66
  %71 = fadd contract double %56, %70
  %72 = add nuw nsw i32 %55, 1
  %73 = add i32 %57, 1
  %74 = icmp eq i32 %73, %39
  br i1 %74, label %75, label %54, !llvm.loop !22

75:                                               ; preds = %54, %50
  %76 = phi double [ %51, %50 ], [ %71, %54 ]
  %77 = add nuw nsw i32 %44, 1
  %78 = icmp eq i32 %77, %3
  br i1 %78, label %47, label %43, !llvm.loop !24

79:                                               ; preds = %43, %79
  %80 = phi i32 [ %202, %79 ], [ 0, %43 ]
  %81 = phi double [ %201, %79 ], [ %45, %43 ]
  %82 = phi i32 [ %203, %79 ], [ 0, %43 ]
  %83 = add i32 %80, %46
  %84 = add i32 %83, %38
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !14
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !14
  %91 = sitofp i32 %90 to double
  %92 = sext i32 %83 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %1, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !20, !amdgpu.noclobber !14
  %95 = fmul contract double %94, %91
  %96 = fadd contract double %81, %95
  %97 = or i32 %80, 1
  %98 = add i32 %97, %46
  %99 = add i32 %98, %38
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !16, !amdgpu.noclobber !14
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !14
  %106 = sitofp i32 %105 to double
  %107 = sext i32 %98 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %1, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !20, !amdgpu.noclobber !14
  %110 = fmul contract double %109, %106
  %111 = fadd contract double %96, %110
  %112 = or i32 %80, 2
  %113 = add i32 %112, %46
  %114 = add i32 %113, %38
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !16, !amdgpu.noclobber !14
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !16, !amdgpu.noclobber !14
  %121 = sitofp i32 %120 to double
  %122 = sext i32 %113 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %1, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !20, !amdgpu.noclobber !14
  %125 = fmul contract double %124, %121
  %126 = fadd contract double %111, %125
  %127 = or i32 %80, 3
  %128 = add i32 %127, %46
  %129 = add i32 %128, %38
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !16, !amdgpu.noclobber !14
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !16, !amdgpu.noclobber !14
  %136 = sitofp i32 %135 to double
  %137 = sext i32 %128 to i64
  %138 = getelementptr inbounds double, double addrspace(1)* %1, i64 %137
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !20, !amdgpu.noclobber !14
  %140 = fmul contract double %139, %136
  %141 = fadd contract double %126, %140
  %142 = or i32 %80, 4
  %143 = add i32 %142, %46
  %144 = add i32 %143, %38
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %145
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !16, !amdgpu.noclobber !14
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %148
  %150 = load i32, i32 addrspace(1)* %149, align 4, !tbaa !16, !amdgpu.noclobber !14
  %151 = sitofp i32 %150 to double
  %152 = sext i32 %143 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %1, i64 %152
  %154 = load double, double addrspace(1)* %153, align 8, !tbaa !20, !amdgpu.noclobber !14
  %155 = fmul contract double %154, %151
  %156 = fadd contract double %141, %155
  %157 = or i32 %80, 5
  %158 = add i32 %157, %46
  %159 = add i32 %158, %38
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %160
  %162 = load i32, i32 addrspace(1)* %161, align 4, !tbaa !16, !amdgpu.noclobber !14
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %163
  %165 = load i32, i32 addrspace(1)* %164, align 4, !tbaa !16, !amdgpu.noclobber !14
  %166 = sitofp i32 %165 to double
  %167 = sext i32 %158 to i64
  %168 = getelementptr inbounds double, double addrspace(1)* %1, i64 %167
  %169 = load double, double addrspace(1)* %168, align 8, !tbaa !20, !amdgpu.noclobber !14
  %170 = fmul contract double %169, %166
  %171 = fadd contract double %156, %170
  %172 = or i32 %80, 6
  %173 = add i32 %172, %46
  %174 = add i32 %173, %38
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %175
  %177 = load i32, i32 addrspace(1)* %176, align 4, !tbaa !16, !amdgpu.noclobber !14
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %178
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !16, !amdgpu.noclobber !14
  %181 = sitofp i32 %180 to double
  %182 = sext i32 %173 to i64
  %183 = getelementptr inbounds double, double addrspace(1)* %1, i64 %182
  %184 = load double, double addrspace(1)* %183, align 8, !tbaa !20, !amdgpu.noclobber !14
  %185 = fmul contract double %184, %181
  %186 = fadd contract double %171, %185
  %187 = or i32 %80, 7
  %188 = add i32 %187, %46
  %189 = add i32 %188, %38
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %190
  %192 = load i32, i32 addrspace(1)* %191, align 4, !tbaa !16, !amdgpu.noclobber !14
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %193
  %195 = load i32, i32 addrspace(1)* %194, align 4, !tbaa !16, !amdgpu.noclobber !14
  %196 = sitofp i32 %195 to double
  %197 = sext i32 %188 to i64
  %198 = getelementptr inbounds double, double addrspace(1)* %1, i64 %197
  %199 = load double, double addrspace(1)* %198, align 8, !tbaa !20, !amdgpu.noclobber !14
  %200 = fmul contract double %199, %196
  %201 = fadd contract double %186, %200
  %202 = add nuw nsw i32 %80, 8
  %203 = add i32 %82, 8
  %204 = icmp eq i32 %203, %41
  br i1 %204, label %50, label %79, !llvm.loop !26

205:                                              ; preds = %47
  %206 = mul nsw i32 %25, %4
  %207 = add i32 %206, %28
  %208 = mul i32 %3, %3
  %209 = mul i32 %208, %207
  %210 = add nsw i32 %209, 12
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %211
  %213 = load i32, i32 addrspace(1)* %212, align 4, !tbaa !16, !amdgpu.noclobber !14
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %214
  %216 = load i32, i32 addrspace(1)* %215, align 4, !tbaa !16, !amdgpu.noclobber !14
  %217 = icmp ne i32 %216, 1
  br label %233

218:                                              ; preds = %47
  %219 = fcmp contract olt double %48, 0xBEB0C6F7A0B5ED8D
  %220 = mul nsw i32 %25, %4
  %221 = add i32 %220, %28
  %222 = mul i32 %3, %3
  %223 = mul i32 %222, %221
  %224 = add nsw i32 %223, 12
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %225
  %227 = load i32, i32 addrspace(1)* %226, align 4, !tbaa !16
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %228
  %230 = load i32, i32 addrspace(1)* %229, align 4, !tbaa !16
  br i1 %219, label %231, label %233

231:                                              ; preds = %218
  %232 = icmp ne i32 %230, -1
  br label %233

233:                                              ; preds = %218, %231, %205
  %234 = phi i32 [ %221, %231 ], [ %207, %205 ], [ %221, %218 ]
  %235 = phi i1 [ %232, %231 ], [ %217, %205 ], [ false, %218 ]
  %236 = phi i32 [ -1, %231 ], [ 1, %205 ], [ %230, %218 ]
  %237 = zext i1 %235 to i32
  %238 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !16, !amdgpu.noclobber !14
  %239 = add nsw i32 %238, %237
  store i32 %239, i32 addrspace(1)* %6, align 4, !tbaa !16
  %240 = sext i32 %234 to i64
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %240
  store i32 %236, i32 addrspace(1)* %241, align 4, !tbaa !16
  br label %242

242:                                              ; preds = %233, %9
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"double", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
