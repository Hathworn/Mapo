; ModuleID = '../data/hip_kernels/12606/0/main.cu'
source_filename = "../data/hip_kernels/12606/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @CudaKernelTextureCubeStrobelight(i8 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i64 %3, i32 %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %1
  %25 = icmp slt i32 %23, %2
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %220

27:                                               ; preds = %6
  %28 = sext i32 %23 to i64
  %29 = mul i64 %28, %3
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = shl nsw i32 %15, 2
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %32
  %34 = sitofp i32 %15 to float
  %35 = fmul contract float %34, 2.000000e+00
  %36 = sitofp i32 %1 to float
  %37 = fdiv contract float %35, %36
  %38 = fadd contract float %37, -1.000000e+00
  %39 = sitofp i32 %23 to float
  %40 = fmul contract float %39, 2.000000e+00
  %41 = sitofp i32 %2 to float
  %42 = fdiv contract float %40, %41
  %43 = fadd contract float %42, -1.000000e+00
  %44 = fmul contract float %38, %38
  %45 = fmul contract float %43, %43
  %46 = fadd contract float %44, %45
  %47 = fcmp olt float %46, 0x39F0000000000000
  %48 = select i1 %47, float 0x41F0000000000000, float 1.000000e+00
  %49 = fmul float %46, %48
  %50 = tail call float @llvm.sqrt.f32(float %49)
  %51 = bitcast float %50 to i32
  %52 = add nsw i32 %51, -1
  %53 = bitcast i32 %52 to float
  %54 = add nsw i32 %51, 1
  %55 = bitcast i32 %54 to float
  %56 = tail call i1 @llvm.amdgcn.class.f32(float %49, i32 608)
  %57 = select i1 %47, float 0x3EF0000000000000, float 1.000000e+00
  %58 = fneg float %55
  %59 = tail call float @llvm.fma.f32(float %58, float %50, float %49)
  %60 = fcmp ogt float %59, 0.000000e+00
  %61 = fneg float %53
  %62 = tail call float @llvm.fma.f32(float %61, float %50, float %49)
  %63 = fcmp ole float %62, 0.000000e+00
  %64 = select i1 %63, float %53, float %50
  %65 = select i1 %60, float %55, float %64
  %66 = fmul float %57, %65
  %67 = select i1 %56, float %49, float %66
  %68 = fmul contract float %67, 0x401921FB60000000
  %69 = fadd contract float %68, %5
  %70 = tail call float @llvm.fabs.f32(float %69)
  %71 = fcmp olt float %70, 1.310720e+05
  br i1 %71, label %72, label %79

72:                                               ; preds = %27
  %73 = fmul float %70, 0x3FE45F3060000000
  %74 = tail call float @llvm.rint.f32(float %73)
  %75 = tail call float @llvm.fma.f32(float %74, float 0xBFF921FB40000000, float %70)
  %76 = tail call float @llvm.fma.f32(float %74, float 0xBE74442D00000000, float %75)
  %77 = tail call float @llvm.fma.f32(float %74, float 0xBCF8469880000000, float %76)
  %78 = fptosi float %74 to i32
  br label %185

79:                                               ; preds = %27
  %80 = bitcast float %70 to i32
  %81 = lshr i32 %80, 23
  %82 = and i32 %80, 8388607
  %83 = or i32 %82, 8388608
  %84 = zext i32 %83 to i64
  %85 = mul nuw nsw i64 %84, 4266746795
  %86 = trunc i64 %85 to i32
  %87 = lshr i64 %85, 32
  %88 = mul nuw nsw i64 %84, 1011060801
  %89 = add nuw nsw i64 %87, %88
  %90 = trunc i64 %89 to i32
  %91 = lshr i64 %89, 32
  %92 = mul nuw nsw i64 %84, 3680671129
  %93 = add nuw nsw i64 %91, %92
  %94 = trunc i64 %93 to i32
  %95 = lshr i64 %93, 32
  %96 = mul nuw nsw i64 %84, 4113882560
  %97 = add nuw nsw i64 %95, %96
  %98 = trunc i64 %97 to i32
  %99 = lshr i64 %97, 32
  %100 = mul nuw nsw i64 %84, 4230436817
  %101 = add nuw nsw i64 %99, %100
  %102 = trunc i64 %101 to i32
  %103 = lshr i64 %101, 32
  %104 = mul nuw nsw i64 %84, 1313084713
  %105 = add nuw nsw i64 %103, %104
  %106 = trunc i64 %105 to i32
  %107 = lshr i64 %105, 32
  %108 = mul nuw nsw i64 %84, 2734261102
  %109 = add nuw nsw i64 %107, %108
  %110 = trunc i64 %109 to i32
  %111 = lshr i64 %109, 32
  %112 = trunc i64 %111 to i32
  %113 = add nsw i32 %81, -120
  %114 = icmp ugt i32 %113, 63
  %115 = select i1 %114, i32 %106, i32 %112
  %116 = select i1 %114, i32 %102, i32 %110
  %117 = select i1 %114, i32 %98, i32 %106
  %118 = select i1 %114, i32 %94, i32 %102
  %119 = select i1 %114, i32 %90, i32 %98
  %120 = select i1 %114, i32 %86, i32 %94
  %121 = select i1 %114, i32 -64, i32 0
  %122 = add nsw i32 %121, %113
  %123 = icmp ugt i32 %122, 31
  %124 = select i1 %123, i32 %116, i32 %115
  %125 = select i1 %123, i32 %117, i32 %116
  %126 = select i1 %123, i32 %118, i32 %117
  %127 = select i1 %123, i32 %119, i32 %118
  %128 = select i1 %123, i32 %120, i32 %119
  %129 = select i1 %123, i32 -32, i32 0
  %130 = add nsw i32 %129, %122
  %131 = icmp ugt i32 %130, 31
  %132 = select i1 %131, i32 %125, i32 %124
  %133 = select i1 %131, i32 %126, i32 %125
  %134 = select i1 %131, i32 %127, i32 %126
  %135 = select i1 %131, i32 %128, i32 %127
  %136 = select i1 %131, i32 -32, i32 0
  %137 = add nsw i32 %136, %130
  %138 = icmp eq i32 %137, 0
  %139 = sub nsw i32 32, %137
  %140 = tail call i32 @llvm.fshr.i32(i32 %132, i32 %133, i32 %139)
  %141 = tail call i32 @llvm.fshr.i32(i32 %133, i32 %134, i32 %139)
  %142 = tail call i32 @llvm.fshr.i32(i32 %134, i32 %135, i32 %139)
  %143 = select i1 %138, i32 %132, i32 %140
  %144 = select i1 %138, i32 %133, i32 %141
  %145 = select i1 %138, i32 %134, i32 %142
  %146 = lshr i32 %143, 29
  %147 = tail call i32 @llvm.fshl.i32(i32 %143, i32 %144, i32 2)
  %148 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %145, i32 2)
  %149 = tail call i32 @llvm.fshl.i32(i32 %145, i32 %135, i32 2)
  %150 = and i32 %146, 1
  %151 = sub nsw i32 0, %150
  %152 = shl i32 %146, 31
  %153 = xor i32 %147, %151
  %154 = xor i32 %148, %151
  %155 = xor i32 %149, %151
  %156 = tail call i32 @llvm.ctlz.i32(i32 %153, i1 false), !range !7
  %157 = sub nsw i32 31, %156
  %158 = tail call i32 @llvm.fshr.i32(i32 %153, i32 %154, i32 %157)
  %159 = tail call i32 @llvm.fshr.i32(i32 %154, i32 %155, i32 %157)
  %160 = shl nuw nsw i32 %156, 23
  %161 = sub nuw nsw i32 1056964608, %160
  %162 = lshr i32 %158, 9
  %163 = or i32 %162, %161
  %164 = or i32 %163, %152
  %165 = bitcast i32 %164 to float
  %166 = tail call i32 @llvm.fshl.i32(i32 %158, i32 %159, i32 23)
  %167 = tail call i32 @llvm.ctlz.i32(i32 %166, i1 false), !range !7
  %168 = fmul float %165, 0x3FF921FB40000000
  %169 = add nuw nsw i32 %167, %156
  %170 = shl nuw nsw i32 %169, 23
  %171 = sub nuw nsw i32 855638016, %170
  %172 = sub nsw i32 31, %167
  %173 = tail call i32 @llvm.fshr.i32(i32 %166, i32 %159, i32 %172)
  %174 = lshr i32 %173, 9
  %175 = or i32 %171, %174
  %176 = or i32 %175, %152
  %177 = bitcast i32 %176 to float
  %178 = fneg float %168
  %179 = tail call float @llvm.fma.f32(float %165, float 0x3FF921FB40000000, float %178)
  %180 = tail call float @llvm.fma.f32(float %165, float 0x3E74442D00000000, float %179)
  %181 = tail call float @llvm.fma.f32(float %177, float 0x3FF921FB40000000, float %180)
  %182 = fadd float %168, %181
  %183 = lshr i32 %143, 30
  %184 = add nuw nsw i32 %150, %183
  br label %185

185:                                              ; preds = %72, %79
  %186 = phi float [ %77, %72 ], [ %182, %79 ]
  %187 = phi i32 [ %78, %72 ], [ %184, %79 ]
  %188 = fmul float %186, %186
  %189 = tail call float @llvm.fmuladd.f32(float %188, float 0xBF29833040000000, float 0x3F81103880000000)
  %190 = tail call float @llvm.fmuladd.f32(float %188, float %189, float 0xBFC55553A0000000)
  %191 = fmul float %188, %190
  %192 = tail call float @llvm.fmuladd.f32(float %186, float %191, float %186)
  %193 = tail call float @llvm.fmuladd.f32(float %188, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %194 = tail call float @llvm.fmuladd.f32(float %188, float %193, float 0x3FA5557EE0000000)
  %195 = tail call float @llvm.fmuladd.f32(float %188, float %194, float 0xBFE0000080000000)
  %196 = tail call float @llvm.fmuladd.f32(float %188, float %195, float 1.000000e+00)
  %197 = fneg float %192
  %198 = and i32 %187, 1
  %199 = icmp eq i32 %198, 0
  %200 = select i1 %199, float %196, float %197
  %201 = bitcast float %200 to i32
  %202 = shl i32 %187, 30
  %203 = and i32 %202, -2147483648
  %204 = xor i32 %203, %201
  %205 = bitcast i32 %204 to float
  %206 = fmul contract float %205, 0x3FD99999A0000000
  %207 = fadd contract float %206, 0x3FE3333340000000
  %208 = fmul contract float %207, 2.550000e+02
  %209 = fptoui float %208 to i8
  %210 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 3
  store i8 -1, i8 addrspace(1)* %210, align 1, !tbaa !8
  %211 = and i32 %4, 1
  %212 = icmp eq i32 %211, 0
  %213 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 2
  %214 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 1
  %215 = sdiv i32 %4, 2
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(1)* %33, i64 %216
  %218 = select i1 %212, i8 %209, i8 0
  %219 = select i1 %212, i8 0, i8 %209
  store i8 %218, i8 addrspace(1)* %213, align 1, !tbaa !8
  store i8 %218, i8 addrspace(1)* %214, align 1, !tbaa !8
  store i8 %218, i8 addrspace(1)* %33, align 1, !tbaa !8
  store i8 %219, i8 addrspace(1)* %217, align 1, !tbaa !8
  br label %220

220:                                              ; preds = %185, %6
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
