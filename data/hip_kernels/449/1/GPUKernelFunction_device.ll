; ModuleID = '../data/hip_kernels/449/1/main.cu'
source_filename = "../data/hip_kernels/449/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.atomdesc = type { float, float, float }

@SHist = external hidden addrspace(3) global [0 x i64], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17GPUKernelFunctionyfP8atomdescPyi(i64 %0, float %1, %struct.atomdesc addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %2, i64 %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %17, i64 %19
  %21 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %20, i64 0, i32 0
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa.struct !16, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %20, i64 0, i32 1
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa.struct !21, !amdgpu.noclobber !5
  %25 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %20, i64 0, i32 2
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa.struct !22, !amdgpu.noclobber !5
  %27 = icmp slt i32 %18, %4
  br i1 %27, label %28, label %33

28:                                               ; preds = %5, %28
  %29 = phi i32 [ %31, %28 ], [ %18, %5 ]
  %30 = getelementptr inbounds [0 x i64], [0 x i64] addrspace(3)* @SHist, i32 0, i32 %29
  store i64 0, i64 addrspace(3)* %30, align 8, !tbaa !23
  %31 = add i32 %29, %11
  %32 = icmp slt i32 %31, %4
  br i1 %32, label %28, label %33, !llvm.loop !25

33:                                               ; preds = %28, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = add nuw nsw i32 %18, 1
  %35 = icmp ult i32 %34, %11
  %36 = add i32 %34, %15
  %37 = zext i32 %36 to i64
  %38 = icmp ult i64 %37, %0
  %39 = select i1 %35, i1 %38, i1 false
  br i1 %39, label %40, label %89

40:                                               ; preds = %33, %40
  %41 = phi i32 [ %83, %40 ], [ %34, %33 ]
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %17, i64 %42
  %44 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %43, i64 0, i32 0
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa.struct !16, !amdgpu.noclobber !5
  %46 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %43, i64 0, i32 1
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa.struct !21, !amdgpu.noclobber !5
  %48 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %43, i64 0, i32 2
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa.struct !22, !amdgpu.noclobber !5
  %50 = fsub contract float %22, %45
  %51 = fmul contract float %50, %50
  %52 = fsub contract float %24, %47
  %53 = fmul contract float %52, %52
  %54 = fadd contract float %51, %53
  %55 = fsub contract float %26, %49
  %56 = fmul contract float %55, %55
  %57 = fadd contract float %54, %56
  %58 = fcmp olt float %57, 0x39F0000000000000
  %59 = select i1 %58, float 0x41F0000000000000, float 1.000000e+00
  %60 = fmul float %57, %59
  %61 = tail call float @llvm.sqrt.f32(float %60)
  %62 = bitcast float %61 to i32
  %63 = add nsw i32 %62, -1
  %64 = bitcast i32 %63 to float
  %65 = add nsw i32 %62, 1
  %66 = bitcast i32 %65 to float
  %67 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 608)
  %68 = select i1 %58, float 0x3EF0000000000000, float 1.000000e+00
  %69 = fneg float %66
  %70 = tail call float @llvm.fma.f32(float %69, float %61, float %60)
  %71 = fcmp ogt float %70, 0.000000e+00
  %72 = fneg float %64
  %73 = tail call float @llvm.fma.f32(float %72, float %61, float %60)
  %74 = fcmp ole float %73, 0.000000e+00
  %75 = select i1 %74, float %64, float %61
  %76 = select i1 %71, float %66, float %75
  %77 = fmul float %68, %76
  %78 = select i1 %67, float %60, float %77
  %79 = fdiv contract float %78, %1
  %80 = fptosi float %79 to i32
  %81 = getelementptr inbounds [0 x i64], [0 x i64] addrspace(3)* @SHist, i32 0, i32 %80
  %82 = atomicrmw add i64 addrspace(3)* %81, i64 1 syncscope("agent-one-as") monotonic, align 8
  %83 = add nuw nsw i32 %41, 1
  %84 = icmp ult i32 %83, %11
  %85 = add i32 %83, %15
  %86 = zext i32 %85 to i64
  %87 = icmp ult i64 %86, %0
  %88 = select i1 %84, i1 %87, i1 false
  br i1 %88, label %40, label %89, !llvm.loop !27

89:                                               ; preds = %40, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = udiv i32 %14, %11
  %91 = mul i32 %90, %11
  %92 = icmp ugt i32 %14, %91
  %93 = zext i1 %92 to i32
  %94 = add i32 %90, -1
  %95 = add i32 %94, %93
  %96 = add i32 %6, 1
  %97 = icmp ult i32 %96, %95
  %98 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %17, i64 %19, i32 0
  %99 = load float, float addrspace(1)* %98, align 4
  %100 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %17, i64 %19, i32 1
  %101 = load float, float addrspace(1)* %100, align 4
  %102 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %17, i64 %19, i32 2
  %103 = load float, float addrspace(1)* %102, align 4
  br i1 %97, label %104, label %156

104:                                              ; preds = %89, %153
  %105 = phi i32 [ %154, %153 ], [ %96, %89 ]
  %106 = mul i32 %105, %11
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %2, i64 %107
  br label %109

109:                                              ; preds = %104, %109
  %110 = phi i32 [ %151, %109 ], [ 0, %104 ]
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %108, i64 %111, i32 0
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !28, !amdgpu.noclobber !5
  %114 = fsub contract float %99, %113
  %115 = fmul contract float %114, %114
  %116 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %108, i64 %111, i32 1
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !30, !amdgpu.noclobber !5
  %118 = fsub contract float %101, %117
  %119 = fmul contract float %118, %118
  %120 = fadd contract float %115, %119
  %121 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %108, i64 %111, i32 2
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !31, !amdgpu.noclobber !5
  %123 = fsub contract float %103, %122
  %124 = fmul contract float %123, %123
  %125 = fadd contract float %120, %124
  %126 = fcmp olt float %125, 0x39F0000000000000
  %127 = select i1 %126, float 0x41F0000000000000, float 1.000000e+00
  %128 = fmul float %125, %127
  %129 = tail call float @llvm.sqrt.f32(float %128)
  %130 = bitcast float %129 to i32
  %131 = add nsw i32 %130, -1
  %132 = bitcast i32 %131 to float
  %133 = add nsw i32 %130, 1
  %134 = bitcast i32 %133 to float
  %135 = tail call i1 @llvm.amdgcn.class.f32(float %128, i32 608)
  %136 = select i1 %126, float 0x3EF0000000000000, float 1.000000e+00
  %137 = fneg float %134
  %138 = tail call float @llvm.fma.f32(float %137, float %129, float %128)
  %139 = fcmp ogt float %138, 0.000000e+00
  %140 = fneg float %132
  %141 = tail call float @llvm.fma.f32(float %140, float %129, float %128)
  %142 = fcmp ole float %141, 0.000000e+00
  %143 = select i1 %142, float %132, float %129
  %144 = select i1 %139, float %134, float %143
  %145 = fmul float %136, %144
  %146 = select i1 %135, float %128, float %145
  %147 = fdiv contract float %146, %1
  %148 = fptosi float %147 to i32
  %149 = getelementptr inbounds [0 x i64], [0 x i64] addrspace(3)* @SHist, i32 0, i32 %148
  %150 = atomicrmw add i64 addrspace(3)* %149, i64 1 syncscope("agent-one-as") monotonic, align 8
  %151 = add nuw nsw i32 %110, 1
  %152 = icmp eq i32 %151, %11
  br i1 %152, label %153, label %109, !llvm.loop !32

153:                                              ; preds = %109
  %154 = add i32 %105, 1
  %155 = icmp ult i32 %154, %95
  br i1 %155, label %104, label %156, !llvm.loop !33

156:                                              ; preds = %153, %89
  %157 = phi i32 [ %96, %89 ], [ %154, %153 ]
  %158 = mul i32 %157, %11
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %2, i64 %159
  %161 = trunc i64 %0 to i32
  %162 = sub i32 %161, %158
  %163 = icmp sgt i32 %162, 0
  br i1 %163, label %164, label %208

164:                                              ; preds = %156, %164
  %165 = phi i32 [ %206, %164 ], [ 0, %156 ]
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %160, i64 %166, i32 0
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !28, !amdgpu.noclobber !5
  %169 = fsub contract float %99, %168
  %170 = fmul contract float %169, %169
  %171 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %160, i64 %166, i32 1
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !30, !amdgpu.noclobber !5
  %173 = fsub contract float %101, %172
  %174 = fmul contract float %173, %173
  %175 = fadd contract float %170, %174
  %176 = getelementptr inbounds %struct.atomdesc, %struct.atomdesc addrspace(1)* %160, i64 %166, i32 2
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !31, !amdgpu.noclobber !5
  %178 = fsub contract float %103, %177
  %179 = fmul contract float %178, %178
  %180 = fadd contract float %175, %179
  %181 = fcmp olt float %180, 0x39F0000000000000
  %182 = select i1 %181, float 0x41F0000000000000, float 1.000000e+00
  %183 = fmul float %180, %182
  %184 = tail call float @llvm.sqrt.f32(float %183)
  %185 = bitcast float %184 to i32
  %186 = add nsw i32 %185, -1
  %187 = bitcast i32 %186 to float
  %188 = add nsw i32 %185, 1
  %189 = bitcast i32 %188 to float
  %190 = tail call i1 @llvm.amdgcn.class.f32(float %183, i32 608)
  %191 = select i1 %181, float 0x3EF0000000000000, float 1.000000e+00
  %192 = fneg float %189
  %193 = tail call float @llvm.fma.f32(float %192, float %184, float %183)
  %194 = fcmp ogt float %193, 0.000000e+00
  %195 = fneg float %187
  %196 = tail call float @llvm.fma.f32(float %195, float %184, float %183)
  %197 = fcmp ole float %196, 0.000000e+00
  %198 = select i1 %197, float %187, float %184
  %199 = select i1 %194, float %189, float %198
  %200 = fmul float %191, %199
  %201 = select i1 %190, float %183, float %200
  %202 = fdiv contract float %201, %1
  %203 = fptosi float %202 to i32
  %204 = getelementptr inbounds [0 x i64], [0 x i64] addrspace(3)* @SHist, i32 0, i32 %203
  %205 = atomicrmw add i64 addrspace(3)* %204, i64 1 syncscope("agent-one-as") monotonic, align 8
  %206 = add nuw nsw i32 %165, 1
  %207 = icmp eq i32 %206, %162
  br i1 %207, label %208, label %164, !llvm.loop !32

208:                                              ; preds = %164, %156
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %27, label %209, label %223

209:                                              ; preds = %208
  %210 = mul i32 %6, %4
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %211
  br label %213

213:                                              ; preds = %209, %213
  %214 = phi i32 [ %18, %209 ], [ %221, %213 ]
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [0 x i64], [0 x i64] addrspace(3)* @SHist, i32 0, i32 %214
  %217 = load i64, i64 addrspace(3)* %216, align 8, !tbaa !23
  %218 = getelementptr inbounds i64, i64 addrspace(1)* %212, i64 %215
  %219 = load i64, i64 addrspace(1)* %218, align 8, !tbaa !23
  %220 = add i64 %219, %217
  store i64 %220, i64 addrspace(1)* %218, align 8, !tbaa !23
  %221 = add i32 %214, %11
  %222 = icmp slt i32 %221, %4
  br i1 %222, label %213, label %223, !llvm.loop !34

223:                                              ; preds = %213, %208
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{i64 0, i64 4, !17, i64 4, i64 4, !17, i64 8, i64 4, !17}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{i64 0, i64 4, !17, i64 4, i64 4, !17}
!22 = !{i64 0, i64 4, !17}
!23 = !{!24, !24, i64 0}
!24 = !{!"long long", !19, i64 0}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.mustprogress"}
!27 = distinct !{!27, !26}
!28 = !{!29, !18, i64 0}
!29 = !{!"_ZTS8atomdesc", !18, i64 0, !18, i64 4, !18, i64 8}
!30 = !{!29, !18, i64 4}
!31 = !{!29, !18, i64 8}
!32 = distinct !{!32, !26}
!33 = distinct !{!33, !26}
!34 = distinct !{!34, !26}
