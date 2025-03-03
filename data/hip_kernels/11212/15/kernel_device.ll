; ModuleID = '../data/hip_kernels/11212/15/main.cu'
source_filename = "../data/hip_kernels/11212/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z6kernelP15HIP_vector_typeIhLj4EEi(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = mul i32 %4, %9
  %14 = add i32 %13, %3
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = udiv i32 %12, %9
  %24 = add nsw i32 %14, -512
  %25 = sitofp i32 %24 to float
  %26 = add nsw i32 %22, -512
  %27 = sitofp i32 %26 to float
  %28 = fmul contract float %25, %25
  %29 = fmul contract float %27, %27
  %30 = fadd contract float %28, %29
  %31 = fcmp olt float %30, 0x39F0000000000000
  %32 = select i1 %31, float 0x41F0000000000000, float 1.000000e+00
  %33 = fmul float %30, %32
  %34 = tail call float @llvm.sqrt.f32(float %33)
  %35 = bitcast float %34 to i32
  %36 = add nsw i32 %35, -1
  %37 = bitcast i32 %36 to float
  %38 = add nsw i32 %35, 1
  %39 = bitcast i32 %38 to float
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 608)
  %41 = select i1 %31, float 0x3EF0000000000000, float 1.000000e+00
  %42 = fneg float %39
  %43 = tail call float @llvm.fma.f32(float %42, float %34, float %33)
  %44 = fcmp ogt float %43, 0.000000e+00
  %45 = fneg float %37
  %46 = tail call float @llvm.fma.f32(float %45, float %34, float %33)
  %47 = fcmp ole float %46, 0.000000e+00
  %48 = select i1 %47, float %37, float %34
  %49 = select i1 %44, float %39, float %48
  %50 = fmul float %41, %49
  %51 = select i1 %40, float %33, float %50
  %52 = fdiv contract float %51, 1.000000e+01
  %53 = sitofp i32 %1 to float
  %54 = fdiv contract float %53, 7.000000e+00
  %55 = fsub contract float %52, %54
  %56 = tail call float @llvm.fabs.f32(float %55)
  %57 = fcmp olt float %56, 1.310720e+05
  br i1 %57, label %58, label %65

58:                                               ; preds = %2
  %59 = fmul float %56, 0x3FE45F3060000000
  %60 = tail call float @llvm.rint.f32(float %59)
  %61 = tail call float @llvm.fma.f32(float %60, float 0xBFF921FB40000000, float %56)
  %62 = tail call float @llvm.fma.f32(float %60, float 0xBE74442D00000000, float %61)
  %63 = tail call float @llvm.fma.f32(float %60, float 0xBCF8469880000000, float %62)
  %64 = fptosi float %60 to i32
  br label %171

65:                                               ; preds = %2
  %66 = bitcast float %56 to i32
  %67 = lshr i32 %66, 23
  %68 = and i32 %66, 8388607
  %69 = or i32 %68, 8388608
  %70 = zext i32 %69 to i64
  %71 = mul nuw nsw i64 %70, 4266746795
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = mul nuw nsw i64 %70, 1011060801
  %75 = add nuw nsw i64 %73, %74
  %76 = trunc i64 %75 to i32
  %77 = lshr i64 %75, 32
  %78 = mul nuw nsw i64 %70, 3680671129
  %79 = add nuw nsw i64 %77, %78
  %80 = trunc i64 %79 to i32
  %81 = lshr i64 %79, 32
  %82 = mul nuw nsw i64 %70, 4113882560
  %83 = add nuw nsw i64 %81, %82
  %84 = trunc i64 %83 to i32
  %85 = lshr i64 %83, 32
  %86 = mul nuw nsw i64 %70, 4230436817
  %87 = add nuw nsw i64 %85, %86
  %88 = trunc i64 %87 to i32
  %89 = lshr i64 %87, 32
  %90 = mul nuw nsw i64 %70, 1313084713
  %91 = add nuw nsw i64 %89, %90
  %92 = trunc i64 %91 to i32
  %93 = lshr i64 %91, 32
  %94 = mul nuw nsw i64 %70, 2734261102
  %95 = add nuw nsw i64 %93, %94
  %96 = trunc i64 %95 to i32
  %97 = lshr i64 %95, 32
  %98 = trunc i64 %97 to i32
  %99 = add nsw i32 %67, -120
  %100 = icmp ugt i32 %99, 63
  %101 = select i1 %100, i32 %92, i32 %98
  %102 = select i1 %100, i32 %88, i32 %96
  %103 = select i1 %100, i32 %84, i32 %92
  %104 = select i1 %100, i32 %80, i32 %88
  %105 = select i1 %100, i32 %76, i32 %84
  %106 = select i1 %100, i32 %72, i32 %80
  %107 = select i1 %100, i32 -64, i32 0
  %108 = add nsw i32 %107, %99
  %109 = icmp ugt i32 %108, 31
  %110 = select i1 %109, i32 %102, i32 %101
  %111 = select i1 %109, i32 %103, i32 %102
  %112 = select i1 %109, i32 %104, i32 %103
  %113 = select i1 %109, i32 %105, i32 %104
  %114 = select i1 %109, i32 %106, i32 %105
  %115 = select i1 %109, i32 -32, i32 0
  %116 = add nsw i32 %115, %108
  %117 = icmp ugt i32 %116, 31
  %118 = select i1 %117, i32 %111, i32 %110
  %119 = select i1 %117, i32 %112, i32 %111
  %120 = select i1 %117, i32 %113, i32 %112
  %121 = select i1 %117, i32 %114, i32 %113
  %122 = select i1 %117, i32 -32, i32 0
  %123 = add nsw i32 %122, %116
  %124 = icmp eq i32 %123, 0
  %125 = sub nsw i32 32, %123
  %126 = tail call i32 @llvm.fshr.i32(i32 %118, i32 %119, i32 %125)
  %127 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %120, i32 %125)
  %128 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %125)
  %129 = select i1 %124, i32 %118, i32 %126
  %130 = select i1 %124, i32 %119, i32 %127
  %131 = select i1 %124, i32 %120, i32 %128
  %132 = lshr i32 %129, 29
  %133 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %130, i32 2)
  %134 = tail call i32 @llvm.fshl.i32(i32 %130, i32 %131, i32 2)
  %135 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %121, i32 2)
  %136 = and i32 %132, 1
  %137 = sub nsw i32 0, %136
  %138 = shl i32 %132, 31
  %139 = xor i32 %133, %137
  %140 = xor i32 %134, %137
  %141 = xor i32 %135, %137
  %142 = tail call i32 @llvm.ctlz.i32(i32 %139, i1 false), !range !16
  %143 = sub nsw i32 31, %142
  %144 = tail call i32 @llvm.fshr.i32(i32 %139, i32 %140, i32 %143)
  %145 = tail call i32 @llvm.fshr.i32(i32 %140, i32 %141, i32 %143)
  %146 = shl nuw nsw i32 %142, 23
  %147 = sub nuw nsw i32 1056964608, %146
  %148 = lshr i32 %144, 9
  %149 = or i32 %148, %147
  %150 = or i32 %149, %138
  %151 = bitcast i32 %150 to float
  %152 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %145, i32 23)
  %153 = tail call i32 @llvm.ctlz.i32(i32 %152, i1 false), !range !16
  %154 = fmul float %151, 0x3FF921FB40000000
  %155 = add nuw nsw i32 %153, %142
  %156 = shl nuw nsw i32 %155, 23
  %157 = sub nuw nsw i32 855638016, %156
  %158 = sub nsw i32 31, %153
  %159 = tail call i32 @llvm.fshr.i32(i32 %152, i32 %145, i32 %158)
  %160 = lshr i32 %159, 9
  %161 = or i32 %157, %160
  %162 = or i32 %161, %138
  %163 = bitcast i32 %162 to float
  %164 = fneg float %154
  %165 = tail call float @llvm.fma.f32(float %151, float 0x3FF921FB40000000, float %164)
  %166 = tail call float @llvm.fma.f32(float %151, float 0x3E74442D00000000, float %165)
  %167 = tail call float @llvm.fma.f32(float %163, float 0x3FF921FB40000000, float %166)
  %168 = fadd float %154, %167
  %169 = lshr i32 %129, 30
  %170 = add nuw nsw i32 %136, %169
  br label %171

171:                                              ; preds = %58, %65
  %172 = phi float [ %63, %58 ], [ %168, %65 ]
  %173 = phi i32 [ %64, %58 ], [ %170, %65 ]
  %174 = mul i32 %22, %9
  %175 = mul i32 %23, %9
  %176 = icmp ugt i32 %12, %175
  %177 = zext i1 %176 to i32
  %178 = add i32 %23, %177
  %179 = mul i32 %174, %178
  %180 = add i32 %179, %14
  %181 = fmul float %172, %172
  %182 = tail call float @llvm.fmuladd.f32(float %181, float 0xBF29833040000000, float 0x3F81103880000000)
  %183 = tail call float @llvm.fmuladd.f32(float %181, float %182, float 0xBFC55553A0000000)
  %184 = fmul float %181, %183
  %185 = tail call float @llvm.fmuladd.f32(float %172, float %184, float %172)
  %186 = tail call float @llvm.fmuladd.f32(float %181, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %187 = tail call float @llvm.fmuladd.f32(float %181, float %186, float 0x3FA5557EE0000000)
  %188 = tail call float @llvm.fmuladd.f32(float %181, float %187, float 0xBFE0000080000000)
  %189 = tail call float @llvm.fmuladd.f32(float %181, float %188, float 1.000000e+00)
  %190 = fneg float %185
  %191 = and i32 %173, 1
  %192 = icmp eq i32 %191, 0
  %193 = select i1 %192, float %189, float %190
  %194 = bitcast float %193 to i32
  %195 = shl i32 %173, 30
  %196 = and i32 %195, -2147483648
  %197 = xor i32 %196, %194
  %198 = bitcast i32 %197 to float
  %199 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 504)
  %200 = fmul contract float %198, 1.270000e+02
  %201 = select i1 %199, float %200, float 0x7FF8000000000000
  %202 = fadd contract float %52, 1.000000e+00
  %203 = fdiv contract float %201, %202
  %204 = fadd contract float %203, 1.280000e+02
  %205 = fptoui float %204 to i8
  %206 = sext i32 %180 to i64
  %207 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %206, i32 0, i32 0, i32 0, i64 0
  store i8 %205, i8 addrspace(1)* %207, align 4, !tbaa !17
  %208 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %206, i32 0, i32 0, i32 0, i64 1
  store i8 %205, i8 addrspace(1)* %208, align 1, !tbaa !17
  %209 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %206, i32 0, i32 0, i32 0, i64 2
  store i8 %205, i8 addrspace(1)* %209, align 2, !tbaa !17
  %210 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %206, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %210, align 1, !tbaa !17
  ret void
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{i32 0, i32 33}
!17 = !{!18, !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
