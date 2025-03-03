; ModuleID = '../data/hip_kernels/17581/19/main.cu'
source_filename = "../data/hip_kernels/17581/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12medianFilterPhS_jji(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp sgt i32 %14, 0
  br i1 %23, label %24, label %251

24:                                               ; preds = %5
  %25 = add i32 %2, -1
  %26 = icmp ult i32 %14, %25
  %27 = icmp sgt i32 %22, 0
  %28 = select i1 %26, i1 %27, i1 false
  %29 = add i32 %3, -1
  %30 = icmp ult i32 %22, %29
  %31 = select i1 %28, i1 %30, i1 false
  %32 = icmp sgt i32 %4, 0
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %251

34:                                               ; preds = %24
  %35 = mul i32 %22, %2
  %36 = add i32 %35, %14
  %37 = mul i32 %36, %4
  %38 = add nuw nsw i32 %22, 1
  %39 = mul i32 %38, %2
  %40 = add i32 %39, %14
  %41 = add i32 %40, -1
  %42 = mul i32 %41, %4
  %43 = add i32 %36, 1
  %44 = mul i32 %43, %4
  %45 = mul i32 %40, %4
  %46 = add i32 %40, 1
  %47 = mul i32 %46, %4
  br label %48

48:                                               ; preds = %34, %48
  %49 = phi i32 [ 0, %34 ], [ %249, %48 ]
  %50 = add i32 %37, %49
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %51
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7
  %54 = insertelement <9 x i8> poison, i8 %53, i64 0
  %55 = add i32 %44, %49
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !7
  %59 = insertelement <9 x i8> %54, i8 %58, i64 1
  %60 = add i32 %42, %49
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !7
  %64 = insertelement <9 x i8> %59, i8 %63, i64 2
  %65 = add i32 %45, %49
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7
  %69 = insertelement <9 x i8> %64, i8 %68, i64 3
  %70 = add i32 %47, %49
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !7
  %74 = insertelement <9 x i8> %69, i8 %73, i64 4
  %75 = icmp ugt i8 %53, %58
  %76 = shufflevector <9 x i8> %74, <9 x i8> poison, <9 x i32> <i32 1, i32 0, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8>
  %77 = select i1 %75, <9 x i8> %76, <9 x i8> %74
  %78 = tail call i8 @llvm.umin.i8(i8 %53, i8 %58)
  %79 = extractelement <9 x i8> %77, i64 2
  %80 = icmp ugt i8 %78, %79
  %81 = insertelement <9 x i8> %77, i8 %79, i64 0
  %82 = insertelement <9 x i8> %81, i8 %78, i64 2
  %83 = select i1 %80, <9 x i8> %82, <9 x i8> %77
  %84 = tail call i8 @llvm.umin.i8(i8 %78, i8 %79)
  %85 = extractelement <9 x i8> %83, i64 3
  %86 = icmp ugt i8 %84, %85
  %87 = insertelement <9 x i8> %83, i8 %85, i64 0
  %88 = insertelement <9 x i8> %87, i8 %84, i64 3
  %89 = select i1 %86, <9 x i8> %88, <9 x i8> %83
  %90 = tail call i8 @llvm.umin.i8(i8 %84, i8 %85)
  %91 = extractelement <9 x i8> %89, i64 4
  %92 = icmp ugt i8 %90, %91
  %93 = insertelement <9 x i8> %89, i8 %91, i64 0
  %94 = insertelement <9 x i8> %93, i8 %90, i64 4
  %95 = select i1 %92, <9 x i8> %94, <9 x i8> %89
  %96 = tail call i8 @llvm.umin.i8(i8 %90, i8 %91)
  %97 = extractelement <9 x i8> %95, i64 5
  %98 = icmp ugt i8 %96, %97
  %99 = insertelement <9 x i8> %95, i8 %97, i64 0
  %100 = insertelement <9 x i8> %99, i8 %96, i64 5
  %101 = select i1 %98, <9 x i8> %100, <9 x i8> %95
  %102 = tail call i8 @llvm.umin.i8(i8 %96, i8 %97)
  %103 = extractelement <9 x i8> %101, i64 6
  %104 = icmp ugt i8 %102, %103
  %105 = insertelement <9 x i8> %101, i8 %103, i64 0
  %106 = insertelement <9 x i8> %105, i8 %102, i64 6
  %107 = select i1 %104, <9 x i8> %106, <9 x i8> %101
  %108 = tail call i8 @llvm.umin.i8(i8 %102, i8 %103)
  %109 = extractelement <9 x i8> %107, i64 7
  %110 = icmp ugt i8 %108, %109
  %111 = insertelement <9 x i8> %107, i8 %109, i64 0
  %112 = insertelement <9 x i8> %111, i8 %108, i64 7
  %113 = select i1 %110, <9 x i8> %112, <9 x i8> %107
  %114 = tail call i8 @llvm.umin.i8(i8 %108, i8 %109)
  %115 = extractelement <9 x i8> %113, i64 8
  %116 = icmp ugt i8 %114, %115
  %117 = insertelement <9 x i8> %113, i8 %115, i64 0
  %118 = insertelement <9 x i8> %117, i8 %114, i64 8
  %119 = select i1 %116, <9 x i8> %118, <9 x i8> %113
  %120 = extractelement <9 x i8> %119, i64 1
  %121 = extractelement <9 x i8> %119, i64 2
  %122 = icmp ugt i8 %120, %121
  %123 = shufflevector <9 x i8> %119, <9 x i8> poison, <9 x i32> <i32 0, i32 2, i32 1, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8>
  %124 = select i1 %122, <9 x i8> %123, <9 x i8> %119
  %125 = tail call i8 @llvm.umin.i8(i8 %120, i8 %121)
  %126 = extractelement <9 x i8> %124, i64 3
  %127 = icmp ugt i8 %125, %126
  %128 = insertelement <9 x i8> %124, i8 %126, i64 1
  %129 = insertelement <9 x i8> %128, i8 %125, i64 3
  %130 = select i1 %127, <9 x i8> %129, <9 x i8> %124
  %131 = tail call i8 @llvm.umin.i8(i8 %125, i8 %126)
  %132 = extractelement <9 x i8> %130, i64 4
  %133 = icmp ugt i8 %131, %132
  %134 = insertelement <9 x i8> %130, i8 %132, i64 1
  %135 = insertelement <9 x i8> %134, i8 %131, i64 4
  %136 = select i1 %133, <9 x i8> %135, <9 x i8> %130
  %137 = tail call i8 @llvm.umin.i8(i8 %131, i8 %132)
  %138 = extractelement <9 x i8> %136, i64 5
  %139 = icmp ugt i8 %137, %138
  %140 = insertelement <9 x i8> %136, i8 %138, i64 1
  %141 = insertelement <9 x i8> %140, i8 %137, i64 5
  %142 = select i1 %139, <9 x i8> %141, <9 x i8> %136
  %143 = tail call i8 @llvm.umin.i8(i8 %137, i8 %138)
  %144 = extractelement <9 x i8> %142, i64 6
  %145 = icmp ugt i8 %143, %144
  %146 = insertelement <9 x i8> %142, i8 %144, i64 1
  %147 = insertelement <9 x i8> %146, i8 %143, i64 6
  %148 = select i1 %145, <9 x i8> %147, <9 x i8> %142
  %149 = tail call i8 @llvm.umin.i8(i8 %143, i8 %144)
  %150 = extractelement <9 x i8> %148, i64 7
  %151 = icmp ugt i8 %149, %150
  %152 = insertelement <9 x i8> %148, i8 %150, i64 1
  %153 = insertelement <9 x i8> %152, i8 %149, i64 7
  %154 = select i1 %151, <9 x i8> %153, <9 x i8> %148
  %155 = tail call i8 @llvm.umin.i8(i8 %149, i8 %150)
  %156 = extractelement <9 x i8> %154, i64 8
  %157 = icmp ugt i8 %155, %156
  %158 = insertelement <9 x i8> %154, i8 %156, i64 1
  %159 = insertelement <9 x i8> %158, i8 %155, i64 8
  %160 = select i1 %157, <9 x i8> %159, <9 x i8> %154
  %161 = extractelement <9 x i8> %160, i64 2
  %162 = extractelement <9 x i8> %160, i64 3
  %163 = icmp ugt i8 %161, %162
  %164 = shufflevector <9 x i8> %160, <9 x i8> poison, <9 x i32> <i32 0, i32 1, i32 3, i32 2, i32 4, i32 5, i32 6, i32 7, i32 8>
  %165 = select i1 %163, <9 x i8> %164, <9 x i8> %160
  %166 = tail call i8 @llvm.umin.i8(i8 %161, i8 %162)
  %167 = extractelement <9 x i8> %165, i64 4
  %168 = icmp ugt i8 %166, %167
  %169 = insertelement <9 x i8> %165, i8 %167, i64 2
  %170 = insertelement <9 x i8> %169, i8 %166, i64 4
  %171 = select i1 %168, <9 x i8> %170, <9 x i8> %165
  %172 = tail call i8 @llvm.umin.i8(i8 %166, i8 %167)
  %173 = extractelement <9 x i8> %171, i64 5
  %174 = icmp ugt i8 %172, %173
  %175 = insertelement <9 x i8> %171, i8 %173, i64 2
  %176 = insertelement <9 x i8> %175, i8 %172, i64 5
  %177 = select i1 %174, <9 x i8> %176, <9 x i8> %171
  %178 = tail call i8 @llvm.umin.i8(i8 %172, i8 %173)
  %179 = extractelement <9 x i8> %177, i64 6
  %180 = icmp ugt i8 %178, %179
  %181 = insertelement <9 x i8> %177, i8 %179, i64 2
  %182 = insertelement <9 x i8> %181, i8 %178, i64 6
  %183 = select i1 %180, <9 x i8> %182, <9 x i8> %177
  %184 = tail call i8 @llvm.umin.i8(i8 %178, i8 %179)
  %185 = extractelement <9 x i8> %183, i64 7
  %186 = icmp ugt i8 %184, %185
  %187 = insertelement <9 x i8> %183, i8 %185, i64 2
  %188 = insertelement <9 x i8> %187, i8 %184, i64 7
  %189 = select i1 %186, <9 x i8> %188, <9 x i8> %183
  %190 = tail call i8 @llvm.umin.i8(i8 %184, i8 %185)
  %191 = extractelement <9 x i8> %189, i64 8
  %192 = icmp ugt i8 %190, %191
  %193 = insertelement <9 x i8> %189, i8 %191, i64 2
  %194 = insertelement <9 x i8> %193, i8 %190, i64 8
  %195 = select i1 %192, <9 x i8> %194, <9 x i8> %189
  %196 = extractelement <9 x i8> %195, i64 3
  %197 = extractelement <9 x i8> %195, i64 4
  %198 = icmp ugt i8 %196, %197
  %199 = shufflevector <9 x i8> %195, <9 x i8> poison, <9 x i32> <i32 0, i32 1, i32 2, i32 4, i32 3, i32 5, i32 6, i32 7, i32 8>
  %200 = select i1 %198, <9 x i8> %199, <9 x i8> %195
  %201 = tail call i8 @llvm.umin.i8(i8 %196, i8 %197)
  %202 = extractelement <9 x i8> %200, i64 5
  %203 = icmp ugt i8 %201, %202
  %204 = insertelement <9 x i8> %200, i8 %202, i64 3
  %205 = insertelement <9 x i8> %204, i8 %201, i64 5
  %206 = select i1 %203, <9 x i8> %205, <9 x i8> %200
  %207 = tail call i8 @llvm.umin.i8(i8 %201, i8 %202)
  %208 = extractelement <9 x i8> %206, i64 6
  %209 = icmp ugt i8 %207, %208
  %210 = insertelement <9 x i8> %206, i8 %208, i64 3
  %211 = insertelement <9 x i8> %210, i8 %207, i64 6
  %212 = select i1 %209, <9 x i8> %211, <9 x i8> %206
  %213 = tail call i8 @llvm.umin.i8(i8 %207, i8 %208)
  %214 = extractelement <9 x i8> %212, i64 7
  %215 = icmp ugt i8 %213, %214
  %216 = insertelement <9 x i8> %212, i8 %214, i64 3
  %217 = insertelement <9 x i8> %216, i8 %213, i64 7
  %218 = select i1 %215, <9 x i8> %217, <9 x i8> %212
  %219 = tail call i8 @llvm.umin.i8(i8 %213, i8 %214)
  %220 = extractelement <9 x i8> %218, i64 8
  %221 = icmp ugt i8 %219, %220
  %222 = insertelement <9 x i8> %218, i8 %220, i64 3
  %223 = insertelement <9 x i8> %222, i8 %219, i64 8
  %224 = select i1 %221, <9 x i8> %223, <9 x i8> %218
  %225 = extractelement <9 x i8> %224, i64 4
  %226 = extractelement <9 x i8> %224, i64 5
  %227 = icmp ugt i8 %225, %226
  %228 = shufflevector <9 x i8> %224, <9 x i8> poison, <9 x i32> <i32 0, i32 1, i32 2, i32 3, i32 5, i32 4, i32 6, i32 7, i32 8>
  %229 = select i1 %227, <9 x i8> %228, <9 x i8> %224
  %230 = tail call i8 @llvm.umin.i8(i8 %225, i8 %226)
  %231 = extractelement <9 x i8> %229, i64 6
  %232 = icmp ugt i8 %230, %231
  %233 = insertelement <9 x i8> %229, i8 %231, i64 4
  %234 = insertelement <9 x i8> %233, i8 %230, i64 6
  %235 = select i1 %232, <9 x i8> %234, <9 x i8> %229
  %236 = tail call i8 @llvm.umin.i8(i8 %230, i8 %231)
  %237 = extractelement <9 x i8> %235, i64 7
  %238 = icmp ugt i8 %236, %237
  %239 = insertelement <9 x i8> %235, i8 %237, i64 4
  %240 = insertelement <9 x i8> %239, i8 %236, i64 7
  %241 = select i1 %238, <9 x i8> %240, <9 x i8> %235
  %242 = tail call i8 @llvm.umin.i8(i8 %236, i8 %237)
  %243 = extractelement <9 x i8> %241, i64 8
  %244 = icmp ugt i8 %242, %243
  %245 = shufflevector <9 x i8> %241, <9 x i8> undef, <9 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 8, i32 undef, i32 undef, i32 undef, i32 undef>
  %246 = select i1 %244, <9 x i8> %245, <9 x i8> %241
  %247 = extractelement <9 x i8> %246, i64 4
  %248 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %51
  store i8 %247, i8 addrspace(1)* %248, align 1, !tbaa !7
  %249 = add nuw nsw i32 %49, 1
  %250 = icmp eq i32 %249, %4
  br i1 %250, label %251, label %48, !llvm.loop !10

251:                                              ; preds = %48, %24, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.umin.i8(i8, i8) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
