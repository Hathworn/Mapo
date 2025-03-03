; ModuleID = '../data/hip_kernels/1193/1/main.cu'
source_filename = "../data/hip_kernels/1193/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.Galaxy = type { float, float, float, float }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17adjust_galaxy_setP6Galaxyi(%struct.Galaxy addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = mul i32 %3, %8
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %14 = add i32 %12, %13
  %15 = udiv i32 %11, %8
  %16 = mul i32 %15, %8
  %17 = icmp ugt i32 %11, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %8
  %21 = icmp slt i32 %14, %1
  br i1 %21, label %23, label %22

22:                                               ; preds = %188, %2
  ret void

23:                                               ; preds = %2, %188
  %24 = phi i32 [ %213, %188 ], [ %14, %2 ]
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.Galaxy, %struct.Galaxy addrspace(1)* %0, i64 %25, i32 0
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16
  %28 = fpext float %27 to double
  %29 = fmul contract double %28, 0x400921FB54442D18
  %30 = fdiv contract double %29, 1.080000e+04
  %31 = fptrunc double %30 to float
  store float %31, float addrspace(1)* %26, align 4, !tbaa !16
  %32 = tail call float @llvm.fabs.f32(float %31)
  %33 = fcmp olt float %32, 1.310720e+05
  br i1 %33, label %34, label %62

34:                                               ; preds = %23
  %35 = fmul float %32, 0x3FE45F3060000000
  %36 = tail call float @llvm.rint.f32(float %35)
  %37 = tail call float @llvm.fma.f32(float %36, float 0xBFF921FB40000000, float %32)
  %38 = tail call float @llvm.fma.f32(float %36, float 0xBE74442D00000000, float %37)
  %39 = tail call float @llvm.fma.f32(float %36, float 0xBCF8469880000000, float %38)
  %40 = fptosi float %36 to i32
  %41 = fmul float %39, %39
  %42 = tail call float @llvm.fmuladd.f32(float %41, float 0xBF29833040000000, float 0x3F81103880000000)
  %43 = tail call float @llvm.fmuladd.f32(float %41, float %42, float 0xBFC55553A0000000)
  %44 = fmul float %41, %43
  %45 = tail call float @llvm.fmuladd.f32(float %39, float %44, float %39)
  %46 = tail call float @llvm.fmuladd.f32(float %41, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %47 = tail call float @llvm.fmuladd.f32(float %41, float %46, float 0x3FA5557EE0000000)
  %48 = tail call float @llvm.fmuladd.f32(float %41, float %47, float 0xBFE0000080000000)
  %49 = tail call float @llvm.fmuladd.f32(float %41, float %48, float 1.000000e+00)
  %50 = fneg float %45
  %51 = and i32 %40, 1
  %52 = icmp eq i32 %51, 0
  %53 = select i1 %52, float %49, float %50
  %54 = bitcast float %53 to i32
  %55 = shl i32 %40, 30
  %56 = and i32 %55, -2147483648
  %57 = xor i32 %56, %54
  %58 = bitcast i32 %57 to float
  %59 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 504)
  %60 = select i1 %59, float %58, float 0x7FF8000000000000
  %61 = bitcast float %32 to i32
  br label %188

62:                                               ; preds = %23
  %63 = bitcast float %32 to i32
  %64 = lshr i32 %63, 23
  %65 = and i32 %63, 8388607
  %66 = or i32 %65, 8388608
  %67 = zext i32 %66 to i64
  %68 = mul nuw nsw i64 %67, 4266746795
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %67, 1011060801
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = mul nuw nsw i64 %67, 3680671129
  %76 = add nuw nsw i64 %74, %75
  %77 = trunc i64 %76 to i32
  %78 = lshr i64 %76, 32
  %79 = mul nuw nsw i64 %67, 4113882560
  %80 = add nuw nsw i64 %78, %79
  %81 = trunc i64 %80 to i32
  %82 = lshr i64 %80, 32
  %83 = mul nuw nsw i64 %67, 4230436817
  %84 = add nuw nsw i64 %82, %83
  %85 = trunc i64 %84 to i32
  %86 = lshr i64 %84, 32
  %87 = mul nuw nsw i64 %67, 1313084713
  %88 = add nuw nsw i64 %86, %87
  %89 = trunc i64 %88 to i32
  %90 = lshr i64 %88, 32
  %91 = mul nuw nsw i64 %67, 2734261102
  %92 = add nuw nsw i64 %90, %91
  %93 = trunc i64 %92 to i32
  %94 = lshr i64 %92, 32
  %95 = trunc i64 %94 to i32
  %96 = add nsw i32 %64, -120
  %97 = icmp ugt i32 %96, 63
  %98 = select i1 %97, i32 %89, i32 %95
  %99 = select i1 %97, i32 %85, i32 %93
  %100 = select i1 %97, i32 %81, i32 %89
  %101 = select i1 %97, i32 %77, i32 %85
  %102 = select i1 %97, i32 %73, i32 %81
  %103 = select i1 %97, i32 %69, i32 %77
  %104 = select i1 %97, i32 -64, i32 0
  %105 = add nsw i32 %104, %96
  %106 = icmp ugt i32 %105, 31
  %107 = select i1 %106, i32 %99, i32 %98
  %108 = select i1 %106, i32 %100, i32 %99
  %109 = select i1 %106, i32 %101, i32 %100
  %110 = select i1 %106, i32 %102, i32 %101
  %111 = select i1 %106, i32 %103, i32 %102
  %112 = select i1 %106, i32 -32, i32 0
  %113 = add nsw i32 %112, %105
  %114 = icmp ugt i32 %113, 31
  %115 = select i1 %114, i32 %108, i32 %107
  %116 = select i1 %114, i32 %109, i32 %108
  %117 = select i1 %114, i32 %110, i32 %109
  %118 = select i1 %114, i32 %111, i32 %110
  %119 = select i1 %114, i32 -32, i32 0
  %120 = add nsw i32 %119, %113
  %121 = icmp eq i32 %120, 0
  %122 = sub nsw i32 32, %120
  %123 = tail call i32 @llvm.fshr.i32(i32 %115, i32 %116, i32 %122)
  %124 = tail call i32 @llvm.fshr.i32(i32 %116, i32 %117, i32 %122)
  %125 = tail call i32 @llvm.fshr.i32(i32 %117, i32 %118, i32 %122)
  %126 = select i1 %121, i32 %115, i32 %123
  %127 = select i1 %121, i32 %116, i32 %124
  %128 = select i1 %121, i32 %117, i32 %125
  %129 = lshr i32 %126, 29
  %130 = tail call i32 @llvm.fshl.i32(i32 %126, i32 %127, i32 2)
  %131 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %128, i32 2)
  %132 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %118, i32 2)
  %133 = and i32 %129, 1
  %134 = sub nsw i32 0, %133
  %135 = shl i32 %129, 31
  %136 = xor i32 %130, %134
  %137 = xor i32 %131, %134
  %138 = xor i32 %132, %134
  %139 = tail call i32 @llvm.ctlz.i32(i32 %136, i1 false), !range !21
  %140 = sub nsw i32 31, %139
  %141 = tail call i32 @llvm.fshr.i32(i32 %136, i32 %137, i32 %140)
  %142 = tail call i32 @llvm.fshr.i32(i32 %137, i32 %138, i32 %140)
  %143 = shl nuw nsw i32 %139, 23
  %144 = sub nuw nsw i32 1056964608, %143
  %145 = lshr i32 %141, 9
  %146 = or i32 %145, %144
  %147 = or i32 %146, %135
  %148 = bitcast i32 %147 to float
  %149 = tail call i32 @llvm.fshl.i32(i32 %141, i32 %142, i32 23)
  %150 = tail call i32 @llvm.ctlz.i32(i32 %149, i1 false), !range !21
  %151 = fmul float %148, 0x3FF921FB40000000
  %152 = add nuw nsw i32 %150, %139
  %153 = shl nuw nsw i32 %152, 23
  %154 = sub nuw nsw i32 855638016, %153
  %155 = sub nsw i32 31, %150
  %156 = tail call i32 @llvm.fshr.i32(i32 %149, i32 %142, i32 %155)
  %157 = lshr i32 %156, 9
  %158 = or i32 %154, %157
  %159 = or i32 %158, %135
  %160 = bitcast i32 %159 to float
  %161 = fneg float %151
  %162 = tail call float @llvm.fma.f32(float %148, float 0x3FF921FB40000000, float %161)
  %163 = tail call float @llvm.fma.f32(float %148, float 0x3E74442D00000000, float %162)
  %164 = tail call float @llvm.fma.f32(float %160, float 0x3FF921FB40000000, float %163)
  %165 = fadd float %151, %164
  %166 = lshr i32 %126, 30
  %167 = add nuw nsw i32 %133, %166
  %168 = fmul float %165, %165
  %169 = tail call float @llvm.fmuladd.f32(float %168, float 0xBF29833040000000, float 0x3F81103880000000)
  %170 = tail call float @llvm.fmuladd.f32(float %168, float %169, float 0xBFC55553A0000000)
  %171 = fmul float %168, %170
  %172 = tail call float @llvm.fmuladd.f32(float %165, float %171, float %165)
  %173 = tail call float @llvm.fmuladd.f32(float %168, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %174 = tail call float @llvm.fmuladd.f32(float %168, float %173, float 0x3FA5557EE0000000)
  %175 = tail call float @llvm.fmuladd.f32(float %168, float %174, float 0xBFE0000080000000)
  %176 = tail call float @llvm.fmuladd.f32(float %168, float %175, float 1.000000e+00)
  %177 = fneg float %172
  %178 = and i32 %167, 1
  %179 = icmp eq i32 %178, 0
  %180 = select i1 %179, float %176, float %177
  %181 = bitcast float %180 to i32
  %182 = shl i32 %167, 30
  %183 = and i32 %182, -2147483648
  %184 = xor i32 %183, %181
  %185 = bitcast i32 %184 to float
  %186 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 504)
  %187 = select i1 %186, float %185, float 0x7FF8000000000000
  br label %188

188:                                              ; preds = %34, %62
  %189 = phi i32 [ %56, %34 ], [ %183, %62 ]
  %190 = phi i32 [ %51, %34 ], [ %178, %62 ]
  %191 = phi float [ %49, %34 ], [ %176, %62 ]
  %192 = phi float [ %45, %34 ], [ %172, %62 ]
  %193 = phi float [ %60, %34 ], [ %187, %62 ]
  %194 = phi i1 [ %59, %34 ], [ %186, %62 ]
  %195 = phi i32 [ %61, %34 ], [ %63, %62 ]
  %196 = getelementptr inbounds %struct.Galaxy, %struct.Galaxy addrspace(1)* %0, i64 %25, i32 1
  store float %193, float addrspace(1)* %196, align 4
  %197 = icmp eq i32 %190, 0
  %198 = select i1 %197, float %192, float %191
  %199 = bitcast float %198 to i32
  %200 = bitcast float %31 to i32
  %201 = xor i32 %195, %200
  %202 = xor i32 %201, %189
  %203 = xor i32 %202, %199
  %204 = bitcast i32 %203 to float
  %205 = select i1 %194, float %204, float 0x7FF8000000000000
  %206 = getelementptr inbounds %struct.Galaxy, %struct.Galaxy addrspace(1)* %0, i64 %25, i32 2
  store float %205, float addrspace(1)* %206, align 4, !tbaa !22
  %207 = getelementptr inbounds %struct.Galaxy, %struct.Galaxy addrspace(1)* %0, i64 %25, i32 3
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !23
  %209 = fpext float %208 to double
  %210 = fmul contract double %209, 0x400921FB54442D18
  %211 = fdiv contract double %210, 1.080000e+04
  %212 = fptrunc double %211 to float
  store float %212, float addrspace(1)* %207, align 4, !tbaa !23
  %213 = add nsw i32 %24, %20
  %214 = icmp slt i32 %213, %1
  br i1 %214, label %23, label %22, !llvm.loop !24
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!16 = !{!17, !18, i64 0}
!17 = !{!"_ZTS6Galaxy", !18, i64 0, !18, i64 4, !18, i64 8, !18, i64 12}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{i32 0, i32 33}
!22 = !{!17, !18, i64 8}
!23 = !{!17, !18, i64 12}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
